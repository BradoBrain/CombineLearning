//
//  PublishedViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 13.06.2022.
//

import Foundation
// We can use @Published property wrapper with ObservableObject to notify any view that @Published has been changed
class PublishedViewModel: ObservableObject {
    @Published var userName = ""
    @Published var validated: String = ""
    
    init() {
        // We create our pipeline here
        $userName // Here is our publisher
            .map { name in
                name.count >= 8 ? "Accepted" : "User name is too short"
            } // Here is our operator
            .assign(to: &$validated) // Here is our subscriber
    }
}
