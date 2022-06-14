//
//  PublishedViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 13.06.2022.
//

import Foundation
import SwiftUI
// We can use @Published property wrapper with ObservableObject to notify any view that @Published has been changed
class PublishedViewModel: ObservableObject {
    @Published var userName = ""
    @Published var validated: String = ""
    @Published var userValidationColor: Color = .red
    
    init() {
        // We create our pipeline here
        $userName // Here is our publisher
            .map { name in
                name.count >= 8 ? "Accepted" : "User name is too short"
            } // Here is our operator
            .assign(to: &$validated) // Here is our subscriber
        
        $userName
            .map { name -> Color in
                name.count >= 8 ? .green : .red
            }
            .assign(to: &$userValidationColor)
    }
}
