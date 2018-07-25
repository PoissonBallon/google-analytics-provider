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
    print("INIT")
    debugPrint(self)
  }
  
  deinit {
    try! self.client.container.syncShutdownGracefully()
    self.logger.info("[GoogleAnalyticsClient] : De-Initializing the client successfully")
  }
  
  func send(hit:GoogleAnalyticsHit) {
    print("GET START")
//    try! self.client.get(URL(string: "https://www.google.fr/")!).wait()
    print("GET END")
  }
}
