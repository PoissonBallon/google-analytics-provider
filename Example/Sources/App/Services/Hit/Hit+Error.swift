//
//  Hit+Error.swift
//  App
//
//  Created by Allan Vialatte on 02/08/2018.
//

import Foundation

public enum HitError: Error {
  case typeParameterIsMissing
  case parameterIsNotValidForHitType(parameter: HitParameter)
  case parameterIsTooLong(parameter: HitParameter)
}
