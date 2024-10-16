//
//  4. Models.swift
//  SlowData
//
//  Created by Xavi Moll on 16/10/24.
//

import SwiftUI
import SwiftData
import Foundation

enum Menu: String, CaseIterable, Hashable, Identifiable {
  
  case optionA
  case optionB
  case all
  
  var id: String { rawValue }
  
  var predicate: Predicate<Item> {
    switch self {
    case .optionA: return #Predicate { $0.isOptionA }
    case .optionB: return #Predicate { !$0.isOptionA }
    case .all: return #Predicate { _ in true }
    }
  }
}

@Model
final class Item: Identifiable {
  
  var isOptionA: Bool
  
  init() {
    self.isOptionA = Bool.random()
  }
}
