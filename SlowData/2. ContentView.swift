//
//  2. ContentView.swift
//  SlowData
//
//  Created by Xavi Moll on 16/10/24.
//

import SwiftUI
import SwiftData
import Foundation

struct ContentView: View {
  
  @Environment(\.modelContext)
  private var modelContext
  
  @State
  var selection: Menu? = .optionA
  
  var body: some View {
    NavigationSplitView {
      List(Menu.allCases, selection: $selection) { menu in
        Text(menu.rawValue).tag(menu)
      }
    } detail: {
      DemoListView(selectedMenu: $selection)
    }.onAppear {
      // Uncomment this and run the app once to seed the database,
      // then comment it out again so it doesn't slow down the launch.
//      (0..<30_000).forEach { index in
//        let item = Item()
//        modelContext.insert(item)
//      }
    }
  }
}
