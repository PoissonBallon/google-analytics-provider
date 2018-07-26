//
//  PageTrackingHit.swift
//  App
//
//  Created by Allan Vialatte on 25/07/2018.
//

import Foundation

struct PageTrackingHit: GoogleAnalyticsHit {
  let type: String = "pageview"
  let documentHostname: String
  let page: String
  let title: String
  
  
  enum CodingKeys: String, CodingKey {
    case type =               "t"
    case documentHostname =   "dh"
    case page =               "dp"
    case title =              "dt"
  }
}
