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
    self.logger.info("[GoogleAnalyticsClient] : De-Initializing the client successfully")
  }
}
