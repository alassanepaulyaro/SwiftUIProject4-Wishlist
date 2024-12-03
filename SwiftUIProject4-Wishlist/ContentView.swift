//
//  ContentView.swift
//  SwiftUIProject4-Wishlist
//
//  Created by Yaro Paul  on 03/12/2024.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var whishes: [Wish]
    @State private var isAlertPresented: Bool = false
    @State private var title: String = ""

    var body: some View {
        NavigationStack {
            List {
                ForEach(whishes) { wish in
                    Text(wish.title)
                        .font(.title.weight(.light))
                        .padding(.vertical, 2)
                }
            }
            .navigationTitle("Wishlist")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isAlertPresented.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .imageScale(.large)
                    }
                }
            }
            .alert("Create a new wish", isPresented: $isAlertPresented) {
                TextField("Enter a wish", text: $title)

                Button {
                    modelContext.insert(Wish(title: title))
                    title = ""

                } label: {
                    Text("Save")
                }
            }
            .overlay {
                if whishes.isEmpty {
                    ContentUnavailableView(
                        "My wishlist", systemImage: "heart.circle",
                        description: Text(
                            "No wishes yet.  Add one to get started."))
                }
            }
        }
    }
}

#Preview("List with Sample Data") {
    let container = try! ModelContainer(
        for: Wish.self,
        configurations: ModelConfiguration(isStoredInMemoryOnly: true))

    container.mainContext.insert(Wish(title: "Master SwiftData"))
    container.mainContext.insert(Wish(title: "Buy a new iPhone"))
    container.mainContext.insert(Wish(title: "Practice latin dances"))
    container.mainContext.insert(Wish(title: "Travel to Europe"))
    container.mainContext.insert(Wish(title: "Make a positive impact"))

    return ContentView()
        .modelContainer(container)
}

#Preview("Empty List") {
    ContentView()
        .modelContainer(for: Wish.self, inMemory: true)

}
