//
//  Hit+Constructor.swift
//  App
//
//  Created by Allan Vialatte on 02/08/2018.
//

import Foundation



// MARK: - Event Tracking Hit Constructor
public extension Hit {
  static func event(category: String, action: String,
                    label: String? = nil, value: String? = nil, userID: String? = nil) -> Hit {
    var parameters: [HitParameter] = [.type(value: HitType.event)]
    parameters.append(.category(value: category))
    parameters.append(.action(value: action))
    
    if let exist = label  { parameters.append(.label(value: exist)) }
    if let exist = value  { parameters.append(.value(value: exist)) }
    if let exist = userID { parameters.append(.userID(value: exist)) }
    return Hit(parameters: parameters)
  }
}

// MARK: - Page Tracking Hit Constructor
public extension Hit {
  
  static func page(documentHostname: String, userID: String? = nil) -> Hit {
    var parameters: [HitParameter] = [.type(value: HitType.page)]
    parameters.append(.documentHostname(value: documentHostname))
    
    if let exist = userID { parameters.append(.userID(value: exist)) }
    return Hit(parameters: parameters)
  }
  
  static func page(path: String, title: String, userID: String? = nil) -> Hit {
    var parameters: [HitParameter] = [.type(value: HitType.page)]
    parameters.append(.path(value: path))
    parameters.append(.title(value: title))
    
    if let exist = userID { parameters.append(.userID(value: exist)) }
    return Hit(parameters: parameters)
  }
  
}
