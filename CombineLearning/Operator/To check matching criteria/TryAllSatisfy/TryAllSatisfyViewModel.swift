//
//  TryAllSatisfyViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 18.06.2022.
//

import Foundation
import Combine

// .tryAllSatisfy - operator that work like the .allSatisfy and can publish an error

struct InvalidNumberError: Error, Identifiable { // CustomError. It conforms to Identifiable to be able to show an alert in the View
    var id = UUID()
}

class TryAllSatisfyViewModel: ObservableObject {
    @Published var numbers: [Int] = []
    @Published var isFibonacciNum = false
    @Published var invalidNumError: InvalidNumberError?
    
    func allOfNumFibanacciCheck() {
        let fibanacciNum = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144]
        
        _ = numbers.publisher
            .tryAllSatisfy { num in // If it detects a number over 144 an error will be thrown and pipeline will be finished
                if num > 144 { throw InvalidNumberError() }
                return fibanacciNum.contains(num)
            }
            .sink(receiveCompletion: { [unowned self] completion in
                switch completion {
                case .failure(let error): self.invalidNumError = error as? InvalidNumberError // receives the error from .tryAllSatisfy
                default: break
                }
            }, receiveValue: { [unowned self] result in
                isFibonacciNum = result
            })
    }
    
    func add(number: String) {
        if number.isEmpty { return }
        numbers.append(Int(number) ?? 0)
    }
    
}
