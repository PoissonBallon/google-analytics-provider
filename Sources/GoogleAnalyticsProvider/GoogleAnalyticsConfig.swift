//
//  GoogleAnalyticsConfig.swift
//  App
//
//  Created by Allan Vialatte on 02/08/2018.
//

import Foundation
import Vapor

public struct GoogleAnalyticsConfig: Service {
  public let version: Int
  public let trackingID: String
  public let clientID: String
  
  public init(trackingID: String, clientID: String = UUID().uuidString, version: Int = 1, debugMode: Bool = false) {
    self.trackingID = trackingID
    self.clientID = clientID
    self.version = version
  }
}

extension GoogleAnalyticsConfig {
  static var payloadMaxSize:                  Int = 8000
  static var analyticsHost:                   String = "https://www.google-analytics.com/collect"
  static var analyticsDebugHost:              String = "https://www.google-analytics.com/debug/collect"
  
}
