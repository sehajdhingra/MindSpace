//
//  EntryItem.swift
//  FinalProject
//
//  Created by Nadia Begum on 01/08/2024.
//

import Foundation
import SwiftData

@Model
class EntryItem {
    var title: String
    
    init(title: String, isImportant: Bool = false) {
          self.title = title
    }
}
