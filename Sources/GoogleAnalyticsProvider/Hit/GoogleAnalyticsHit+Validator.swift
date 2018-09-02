//
//  Hit+Validator.swift
//  App
//
//  Created by Allan Vialatte on 02/08/2018.
//

import Foundation

internal extension GoogleAnalyticsHit {
  internal func validParameters() throws {
    try self.validParametersType()
    try self.validParametersSize()
  }
  
  internal func validParametersType() throws {
    guard let type = parameters.compactMap({ (parameter) -> GoogleAnalyticsHitType? in
      if case let GoogleAnalyticsHitParameter.type(value) = parameter { return value } else { return nil }
    }).first else { throw GoogleAnalyticsHitError.typeParameterIsMissing }
    
    try parameters.forEach {
      guard
        $0.supportedHitTypes.rawValue == type.rawValue ||
          $0.supportedHitTypes.rawValue == GoogleAnalyticsHitType.generic.rawValue else {
            throw GoogleAnalyticsHitError.parameterIsNotValidForHitType(parameter: $0)
      }
    }
  }
  
  internal func validParametersSize() throws {
    if let tooLongParameter = parameters.first(where: { $0.value.lengthOfBytes(using: .utf8) > $0.maxLenght }) {
      throw GoogleAnalyticsHitError.parameterIsTooLong(parameter: tooLongParameter)
    }
  }
  
}
