//
//  GoogleAnalyticsClient.swift
//  App
//
//  Created by Allan Vialatte on 25/07/2018.
//

import Foundation
import Vapor

fileprivate let googleAnalyticsPayloadMaxSize:        Int = 8000
fileprivate let googleAnalyticsHost:                  String = "https://www.google-analytics.com/collect"
fileprivate let googleAnalyticsDebugHost:             String = "https://www.google-analytics.com/debug/collect"



public final class GoogleAnalyticsClient: Service {
  let client: Client
  let config: GoogleAnalyticsConfig
  let logger: Logger
  let host: String
  
  internal init(config: GoogleAnalyticsConfig, client: Client, logger: Logger) {
    self.client = client
    self.config = config
    self.logger = logger
    self.host = client.container.environment.isRelease ? googleAnalyticsHost : googleAnalyticsDebugHost
    self.logger.info("[GAC] : Initializing the client successfully")
  }
  
  deinit {
    try? self.client.container.syncShutdownGracefully()
    self.logger.info("[GAC] : De-Initializing the client successfully")
  }
  
  func send(hit: GoogleAnalyticsHit) {
    self.client.container.future()
      .map { try hit.validParameters() }
      .catch { self.logger.report(error: $0)}
      .flatMap { (_) -> EventLoopFuture<Response> in
        let payload = try self.generatePayload(with: hit)
        self.logger.info("[GAC] : send hit : \(String(data: payload, encoding: .utf8)!)")
        return self.client.post(self.host, headers: HTTPHeaders(), beforeSend: { (request) in
          request.http.body = HTTPBody(data: payload)
        })}
      .catch { self.logger.report(error: $0) }
      .addAwaiter(callback: sendSuccessfully)
  }
  
  func sendSuccessfully(response: FutureResult<Response>) {
    if let error = response.error {
      self.logger.report(error: error)
    } else if let result = response.result {
      self.logger.info("[GAC] : hit sended with response : \(result)")
    }    
  }
  
  func generatePayload(with hit: GoogleAnalyticsHit) throws -> Data {
    var parameters:[GoogleAnalyticsHitParameter] = [
      .version(value: config.version),
      .trackingID(value: config.trackingID),
      .clientID(value: config.clientID)
    ]
    parameters.append(contentsOf: hit.parameters)
    let payloadStr = parameters.map { "\($0.key)=\($0.value)"}.joined(separator: "&")
    guard payloadStr.lengthOfBytes(using: .utf8) < googleAnalyticsPayloadMaxSize else {
      throw GoogleAnalyticsHitError.hitIsTooBig(hit: hit)
    }
    guard let payload = payloadStr.data(using: .utf8) else {
      throw GoogleAnalyticsHitError.hitCantBeGenerate(hit: hit)
    }
    return payload
  }
}
