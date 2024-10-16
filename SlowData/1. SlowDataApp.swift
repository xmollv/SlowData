//
//  SlowDataApp.swift
//  SlowData
//
//  Created by Xavi Moll on 14/10/24.
//

/*
This project has `SWIFT_ENABLE_OPAQUE_TYPE_ERASURE=NO` to
work around the performance issues of Debug builds: https://indieweb.social/@curtclifton/113273571392595819.
*/

import SwiftUI
import SwiftData

@main
struct SlowDataApp: App {
  
  var sharedModelContainer: ModelContainer = {
    let schema = Schema([Item.self])
    let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
    return try! ModelContainer(for: schema, configurations: [modelConfiguration])
  }()
  
  var body: some Scene {
    WindowGroup {
      ContentView()
    }
    .modelContainer(sharedModelContainer)
  }
}
