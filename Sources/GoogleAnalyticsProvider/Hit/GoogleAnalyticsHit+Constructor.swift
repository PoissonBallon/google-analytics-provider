//
//  Hit+Constructor.swift
//  App
//
//  Created by Allan Vialatte on 02/08/2018.
//

import Foundation

// MARK: - Event Tracking Hit Constructor
public extension GoogleAnalyticsHit {
  public static func event(category: String, action: String,
                           label: String? = nil, value: Int? = nil,
                           userID: String? = nil) -> GoogleAnalyticsHit {
    var parameters: [GoogleAnalyticsHitParameter] = [.type(value: GoogleAnalyticsHitType.event)]
    parameters.append(.category(value: category))
    parameters.append(.action(value: action))
    
    if let exist = label  { parameters.append(.label(value: exist)) }
    if let exist = value  { parameters.append(.value(value: exist)) }
    if let exist = userID { parameters.append(.userID(value: exist)) }
    return GoogleAnalyticsHit(parameters: parameters)
  }
}

// MARK: - Page Tracking Hit Constructor
public extension GoogleAnalyticsHit {
  
  public static func page(documentHostname: String, userID: String? = nil) -> GoogleAnalyticsHit {
    var parameters: [GoogleAnalyticsHitParameter] = [.type(value: GoogleAnalyticsHitType.page)]
    parameters.append(.documentHostname(value: documentHostname))
    
    if let exist = userID { parameters.append(.userID(value: exist)) }
    return GoogleAnalyticsHit(parameters: parameters)
  }
  
  public static func page(path: String, title: String, userID: String? = nil) -> GoogleAnalyticsHit {
    var parameters: [GoogleAnalyticsHitParameter] = [.type(value: GoogleAnalyticsHitType.page)]
    parameters.append(.path(value: path))
    parameters.append(.title(value: title))
    
    if let exist = userID { parameters.append(.userID(value: exist)) }
    return GoogleAnalyticsHit(parameters: parameters)
  }
  
}
