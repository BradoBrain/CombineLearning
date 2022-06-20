//
//  TryMaxByViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 20.06.2022.
//

import Foundation
import Combine

// .tryMax(by: ) - operator that works like .max(by: ) and able to throw an error

struct InvalidCityError: Identifiable, Error {
    let id = UUID()
    var city = ""
}

class TryMaxByViewModel: ObservableObject {
    @Published var appartment: [Appartment] = []
    @Published var maxValue = ""
    @Published var invalidCity: InvalidCityError?
    
    func fetch() {
        let inputData = [
            Appartment(appartmentTitle: "Appartment 1", city: "Kyiv", cost: 15_000),
            Appartment(appartmentTitle: "Appartment 2", city: "Odesa", cost: 12_000),
            Appartment(appartmentTitle: "Appartment 3", city: "Lviv", cost: 13_000),
            Appartment(appartmentTitle: "Appartment 4", city: "Unknown", cost: 17_000)
        ]
        
        appartment = inputData
        
        _ = inputData.publisher
            .tryMax(by: { (current, next) -> Bool in
                if current.city == "Unknown" {
                    throw InvalidCityError(city: "Unknown")
                }
                return current.city > next.city
            })
            .sink(receiveCompletion: { [unowned self] completion in
                if case .failure(let error) = completion {
                    self.invalidCity = error as? InvalidCityError
                }
            }, receiveValue: { [unowned self] appartment in
                self.maxValue = appartment.city
            })
    }
}
