//
//  PageTrackingHit.swift
//  App
//
//  Created by Allan Vialatte on 25/07/2018.
//

import Foundation

//          Page Tracking

//          v=1              // Version.
//          &tid=UA-XXXXX-Y  // Tracking ID / Property ID.
//          &cid=555         // Anonymous Client ID.
//
//          &t=pageview      // Pageview hit type.
//          &dh=mydemo.com   // Document hostname.
//          &dp=/home        // Page.
//          &dt=homepage     // Title.

struct PageTrackingHit: GoogleAnalyticsHit {
  let type: String = "pageview"
  let documentHostname: String
  let page: String
  let title: String
  
  
  enum CodingKeys: String, CodingKey {
    case type = "t"
    case documentHostname = "dh"
    case page = "dp"
    case title = "dt"
  }
}
