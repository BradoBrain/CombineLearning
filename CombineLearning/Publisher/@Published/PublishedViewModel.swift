//
//  PublishedViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 13.06.2022.
//

import Foundation
// We can use @Published property wrapper with ObservableObject to notify any view that @Published has been changed
class PublishedViewModel: ObservableObject {
    @Published var name = ""
    @Published var validated: String = ""
    
    init() {
        // We create our pipeline here
        $name // Here is our publisher
            .map { name in
                name.isEmpty ? "X" : "V"
                
            } // Here is our operator
            .assign(to: &$validated) // Here is our subscriber
    }
}
