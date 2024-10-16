//
//  3.swift
//  SlowData
//
//  Created by Xavi Moll on 16/10/24.
//

import SwiftUI
import SwiftData
import Foundation

struct DemoListView: View {
  
  @Binding
  var selectedMenu: Menu?
  
  @Query
  private var items: [Item]
  
  init(selectedMenu: Binding<Menu?>) {
    self._selectedMenu = selectedMenu
    self._items = Query(filter: selectedMenu.wrappedValue?.predicate)
  }
  
  var body: some View {
    /*
     The issue happens here. Any view that touches the `items` property generates a hang. Originally,
     I thought the issue could come from the List, but when changing it for a ScrollView + LazyVStack + ForEach,
     the issue is the same. You could even replace the current implementation for the following and the hang is still there:
     ```
     let _: [Item] = items
     Text("hello").navigationTitle(selectedMenu?.rawValue ?? "N/A")
     ```
     */
    List(items) { item in
      ListRowView(item: item)
    }
    .navigationTitle(selectedMenu?.rawValue ?? "N/A")
  }
}

struct ListRowView: View {
  
  let item: Item
  
  var body: some View {
    Text(item.isOptionA ? "Option A" : "Option B")
  }
}
