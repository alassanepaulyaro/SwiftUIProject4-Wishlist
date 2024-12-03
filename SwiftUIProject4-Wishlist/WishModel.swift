//
//  WishModel.swift
//  SwiftUIProject4-Wishlist
//
//  Created by Yaro Paul  on 03/12/2024.
//

import Foundation
import SwiftData

@Model
class Wish {
    var title: String
    
    init(title: String) {
        self.title = title
    }
}
