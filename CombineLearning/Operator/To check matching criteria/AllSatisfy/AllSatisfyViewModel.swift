//
//  AllSatisfyViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 18.06.2022.
//

import Foundation
import Combine

// .allStisfy - operator to test all items that are coming through pipeline and check the criteria. As soon as on of the items does not match it, false will be published. If all items match criteria then true is published.

class AllSatisfyViewModel: ObservableObject {
    @Published var numbers: [Int] = []
    @Published var isFibonacciNum = false
    
    func isFibonacciCheck() {
        let fibonacciNum = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144]
        
        numbers.publisher // This is sequence publisher to send every item individually. $numbers doesn't work becouse the type is array
            .allSatisfy { number in // it will check every single num in the array. As soon as this function find not Fibonacci num, false will be
                fibonacciNum.contains(number) // published and pipeline will be finished
            }
            .assign(to: &$isFibonacciNum)
    }
    
    func addNum(number: String) {
        if number.isEmpty { return }
        numbers.append(Int(number) ?? 0)
    }
}

