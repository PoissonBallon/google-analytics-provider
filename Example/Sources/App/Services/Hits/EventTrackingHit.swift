//
//  EventTrackingHit.swift
//  App
//
//  Created by Allan Vialatte on 25/07/2018.
//

import Foundation

struct EventTrackingHit: GoogleAnalyticsHit {
  let type: String = "pageview"
  let category: String
  let action: String
  let label: String?
  let value: String?
  
  enum CodingKeys: String, CodingKey {
    case type       = "t"
    case category   = "ec"
    case action     = "ea"
    case label      = "el"
    case value      = "ev"
  }
}
