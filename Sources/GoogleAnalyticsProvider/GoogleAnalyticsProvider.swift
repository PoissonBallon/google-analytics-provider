//
//  GoogleAnalyticsProvider.swift
//  App
//
//  Created by Allan Vialatte on 25/07/2018.
//

import Foundation
import Vapor



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
