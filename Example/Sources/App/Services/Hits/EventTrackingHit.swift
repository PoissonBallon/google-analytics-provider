//
//  EventTrackingHit.swift
//  App
//
//  Created by Allan Vialatte on 25/07/2018.
//

import Foundation

//                    Event Tracking

//                    v=1              // Version.
//                    &tid=UA-XXXXX-Y  // Tracking ID / Property ID.
//                    &cid=555         // Anonymous Client ID.
//
//                    &t=event         // Event hit type
//                    &ec=video        // Event Category. Required.
//                    &ea=play         // Event Action. Required.
//                    &el=holiday      // Event label.
//                    &ev=300          // Event value.

struct EventTrackingHit: GoogleAnalyticsHit {
  let type: String = "pageview"
  let category: String
  let action: String
  let label: String?
  let value: String?
  
  enum CodingKeys: String, CodingKey {
    case type = "t"
    case category = "ec"
    case action = "ea"
    case label = "el"
    case value = "ev"
  }
}
