//
//  GoogleAnalyticsClient.swift
//  App
//
//  Created by Allan Vialatte on 25/07/2018.
//

import Foundation
import Vapor

public final class GoogleAnalyticsClient: Service {
  let client: Client
  let config: GoogleAnalyticsConfig
  let logger: Logger
  
  internal init(config: GoogleAnalyticsConfig, client: Client, logger: Logger) {
    self.client = client
    self.config = config
    self.logger = logger
    self.logger.info("[GoogleAnalyticsClient] : Initializing the client successfully")    
  }
  
  deinit {
    try? self.client.container.syncShutdownGracefully()
    self.logger.info("[GoogleAnalyticsClient] : De-Initializing the client successfully")
  }
  
  func send(hit: Hit) {
    self.logger.info("[GoogleAnalyticsClient] : send hit")
    self.client.container.future().map {
      try hit.validParameters()
      }.catch {
        self.logger.report(error: $0)
      }.flatMap {
        self.client.get(URL(string: "https://www.google.fr/")!)
      }.addAwaiter(callback: sendSuccessfully)
  }
  
  func sendSuccessfully(response: FutureResult<Response>) {
    self.logger.info("[GoogleAnalyticsClient] : hit sended")
  }
}
