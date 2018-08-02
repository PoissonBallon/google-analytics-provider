//
//  GoogleAnalyticsHit.swift
//  App
//
//  Created by Allan Vialatte on 25/07/2018.
//

import Foundation

public struct Hit {
  let parameters: [HitParameter]
  
  internal init(parameters: [HitParameter]) {
    self.parameters = parameters
  }
}



