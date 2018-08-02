//
//  GoogleAnalyticsHit.swift
//  App
//
//  Created by Allan Vialatte on 25/07/2018.
//

import Foundation

typealias Payload = String

public struct GoogleAnalyticsHit {
  internal let parameters: [GoogleAnalyticsHitParameter]
  
  internal init(parameters: [GoogleAnalyticsHitParameter]) {
    self.parameters = parameters
  }
}



