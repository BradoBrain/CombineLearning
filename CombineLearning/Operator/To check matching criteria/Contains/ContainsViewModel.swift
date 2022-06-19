//
//  ContainsViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 19.06.2022.
//

import Foundation
import Combine

// Contains - operator that signal if an item coming through pipeline matches criteria. It publishes the true and finishes pipeline when match is found. Others data will not go through the pipeline flow.
// If there is no value that match our criteria it publishes the false and closes pipeline.

class ContainsViewModel: ObservableObject {
    @Published var description = ""
    @Published var sixStrings = false
    @Published var sevenStrings = false
    @Published var eightStrings = false
    @Published var electric = false
    @Published var acoustic = false
    
    var cancellable: [AnyCancellable] = []
    
    func fetch() {
        let inputData = ["Guitar", "Telecaster", "6 Strings", "Electric"]
        
        inputData.publisher
            .prefix(2) // returns first 2 items
            .sink { [unowned self] item in
                description += item + ""
            }
            .store(in: &cancellable)
        
        inputData.publisher
            .contains("6 Strings")
            .assign(to: &$sixStrings)
        
        inputData.publisher
            .contains("7 Strings")
            .assign(to: &$sevenStrings)
        
        inputData.publisher
            .contains("8 Strings")
            .assign(to: &$eightStrings)
        
        inputData.publisher
            .contains("Electric")
            .assign(to: &$electric)
        
        inputData.publisher
            .contains("Acoustic")
            .assign(to: &$acoustic)
    }
}
