//
//  GoogleAnalyticsHit+Error.swift
//  App
//
//  Created by Allan Vialatte on 02/08/2018.
//

import Foundation

public enum GoogleAnalyticsHitError: Error {
  case typeParameterIsMissing

  case hitIsTooBig(hit: GoogleAnalyticsHit)
  case hitCantBeGenerate(hit: GoogleAnalyticsHit)

  case parameterIsNotValidForHitType(parameter: GoogleAnalyticsHitParameter)
  case parameterIsTooLong(parameter: GoogleAnalyticsHitParameter)
}

extension GoogleAnalyticsHitError: LocalizedError {
  public var errorDescription: String? {
    switch self {
    case .typeParameterIsMissing:
      return "Parameter type is missing"
    case .parameterIsNotValidForHitType(let parameter):
      return "Parameter [\(parameter.key) : \(parameter.value)] is not valid for this hit"
    case .parameterIsTooLong(let parameter):
      return "Parameter [\(parameter.key) : \(parameter.value)] exceeds max size (\(parameter.maxLenght) Bytes)"
    case .hitIsTooBig(let hit):
      return "Hit : \(hit.parameters) exceeds max size (\(GoogleAnalyticsConfig.payloadMaxSize) Bytes"
    case .hitCantBeGenerate(let hit):
    return "Hit : \(hit.parameters) cant be generate"
    }
  }
}
