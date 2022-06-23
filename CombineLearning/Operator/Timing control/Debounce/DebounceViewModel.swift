//
//  DebounceViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 23.06.2022.
//

import Foundation
import Combine

// .debounce - operator like a pause.

class DebounceViewModel: ObservableObject {
    @Published var word = ""
    @Published var wordEntered = ""
    
    init() {
        $word
            .debounce(for: 1, scheduler: RunLoop.main)
            .assign(to: &$wordEntered)
    }
}
