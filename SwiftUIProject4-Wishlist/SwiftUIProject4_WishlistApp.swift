//
//  SwiftUIProject4_WishlistApp.swift
//  SwiftUIProject4-Wishlist
//
//  Created by Yaro Paul  on 03/12/2024.
//

import SwiftUI
import SwiftData

@main
struct SwiftUIProject4_WishlistApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for : Wish.self)
        }
    }
}
