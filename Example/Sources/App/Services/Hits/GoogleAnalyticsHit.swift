//
//  GoogleAnalyticsHit.swift
//  App
//
//  Created by Allan Vialatte on 25/07/2018.
//

import Foundation

protocol GoogleAnalyticsHit: Codable {
  var type: String { get }
}
