//
//  ContentView.swift
//  SwiftUIProject4-Wishlist
//
//  Created by Yaro Paul  on 03/12/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var whishes: [Wish]
    
    var body: some View {
      NavigationStack {
            List {
                ForEach(whishes) { wish in
                    Text(wish.title)
                }
            }
            .navigationTitle("Wishlist")
            .overlay  {
                if whishes.isEmpty {
                    ContentUnavailableView( "My wishlist", systemImage: "heart.circle",
                    description: Text("No wishes yet.  Add one to get started."))
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Wish.self, inMemory: true)
    
}
