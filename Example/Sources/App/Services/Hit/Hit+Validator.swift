//
//  Hit+Validator.swift
//  App
//
//  Created by Allan Vialatte on 02/08/2018.
//

import Foundation

internal extension Hit {
  internal func validParameters() throws {
    try self.validParametersType()
    try self.validParametersSize()
  }
  
  internal func validParametersType() throws {
    guard let type = parameters.compactMap({ (parameter) -> HitType? in
      if case let HitParameter.type(value) = parameter { return value } else { return nil }
    }).first else { throw HitError.typeParameterIsMissing }
    
    try parameters.forEach {
      guard
        $0.supportedHitTypes.rawValue == type.rawValue ||
          $0.supportedHitTypes.rawValue == HitType.generic.rawValue else {
            throw HitError.parameterIsNotValidForHitType(parameter: $0)
      }
    }
  }
  
  internal func validParametersSize() throws {
    if let tooLongParameter = parameters.first(where: { $0.value.lengthOfBytes(using: .utf8) > $0.maxLenght }) {
      throw HitError.parameterIsTooLong(parameter: tooLongParameter)
    }
  }
  
}
