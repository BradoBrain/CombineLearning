//
//  FirstViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 01.07.2022.
//

import Foundation
import Combine

// .first - operator that will publish the first element that comes through pipeline and close it

class FirstViewModel: ObservableObject {
    @Published var dataForView: [String] = []
    @Published var firstItem = ""
    
    func fetch() {
        let inputData = ["Kyiv", "Odesa", "Lviv", "Mariupol"]
        
        _ = inputData.publisher
            .sink { self.dataForView.append($0) }
        
        dataForView.publisher
            .first()
            .assign(to: &$firstItem)
    }
}
