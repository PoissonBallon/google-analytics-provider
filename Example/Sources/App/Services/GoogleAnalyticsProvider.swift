//
//  GoogleAnalyticsProvider.swift
//  App
//
//  Created by Allan Vialatte on 25/07/2018.
//

import Foundation
import Vapor

public struct GoogleAnalyticsConfig: Service {
  public let version: Int
  public let trackingID: String
  public let clientID: String

  public init(trackingID: String, clientID: String = UUID().uuidString, version: Int = 1) {
    self.trackingID = trackingID
    self.clientID = clientID
    self.version = version
  }
}

public final class GoogleAnalyticsProvider: Provider {

  public init() { }
  
  public func boot(_ worker: Container) throws { }
  
  public func didBoot(_ worker: Container) throws -> EventLoopFuture<Void> {
    return .done(on: worker)
  }
  
  public func register(_ services: inout Services) throws {
    services.register { (container) -> GoogleAnalyticsClient in
      let subContainer = container.subContainer(on:  MultiThreadedEventLoopGroup(numberOfThreads: System.coreCount))
      let httpClient = try subContainer.make(Client.self)
      let config = try subContainer.make(GoogleAnalyticsConfig.self)
      let logger = try subContainer.make(Logger.self)
      return GoogleAnalyticsClient(config: config, client: httpClient, logger: logger)
    }
  }
}
