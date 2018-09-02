//
//  Parameter.swift
//  App
//
//  Created by Allan Vialatte on 02/08/2018.
//

import Foundation

public enum GoogleAnalyticsHitParameter {
  // Config Parameter
  case version(value: Int)
  case trackingID(value: String)
  case clientID(value: String)
  
  // Generic Parameter
  case type(value: GoogleAnalyticsHitType)
  case userID(value: String)
  
  // Event Parameter
  case category(value: String)
  case action(value: String)
  case label(value: String)
  case value(value: Int)
  
  // Page Parameter
  case documentHostname(value: String)
  case path(value: String)
  case title(value: String)
}


internal extension GoogleAnalyticsHitParameter {
  
  var key: String {
    switch self {
    case .version:            return "v"
    case .trackingID:         return "tid"
    case .clientID:           return "cid"
    case .type:               return "t"
    case .userID:             return "uid"
    case .category:           return "ec"
    case .action:             return "ea"
    case .label:              return "el"
    case .value:              return "ev"
    case .documentHostname:   return "dh"
    case .path:               return "dp"
    case .title:              return "dt"
    }
  }
  
  var maxLenght: Int {
    switch self {
    case .version:            return Int.max
    case .trackingID:         return Int.max
    case .clientID:           return Int.max
    case .type:               return Int.max
    case .userID:             return Int.max
    case .category:           return 150
    case .action:             return 500
    case .label:              return 500
    case .value:              return Int.max
    case .documentHostname:   return 100
    case .path:               return 2048
    case .title:              return 1500
    }
  }
  
  
  var supportedHitTypes: GoogleAnalyticsHitType {
    switch self {
    case .version:            return .generic
    case .trackingID:         return .generic
    case .clientID:           return .generic
    case .type:               return .generic
    case .userID:             return .generic
    case .category:           return .event
    case .action:             return .event
    case .label:              return .event
    case .value:              return .event
    case .documentHostname:   return .generic
    case .path:               return .generic
    case .title:              return .generic
    }
  }
  
  var value: String {
    switch self {
    case .version(let value):             return "\(value)"
    case .trackingID(let value):          return value
    case .clientID(let value):            return value
    case .type(let value):                return value.rawValue
    case .userID(let value):              return value
    case .category(let value):            return value
    case .action(let value):              return value
    case .label(let value):               return value
    case .value(let value):               return "\(value)"
    case .documentHostname(let value):    return value
    case .path(let value):                return value
    case .title(let value):               return value
    }
  }
}
