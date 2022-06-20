//
//  MaxViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 20.06.2022.
//

import Foundation
import Combine

// .max - operator republishes just maximum value from upstream (it do that only when publisher has finished with all of items).


class MaxViewModel: ObservableObject {
    @Published var stringArray: [String] = []
    @Published var maxString = ""
    @Published var intArray: [Int] = []
    @Published var maxInt = 0
    
    func fetch() {
        let inputString = ["Artem", "Demid", "Oksana"]
        
        stringArray = inputString // To write data from inputString to stringArray
        inputString.publisher
            .max()
            .assign(to: &$maxString)
        
        let inputInt = [37, 9, 38]
        
        intArray = inputInt
        inputInt.publisher
            .max()
            .assign(to: &$maxInt)
    }
}

