//
//  MaxByViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 20.06.2022.
//

import Foundation
import Combine

// .max(by: ) - operator that republishes max value it receive from upstream using criteria you specify. We can get and weigh value against each other. With this operator pipeline knows how to sort item and it's able to publish min value.

struct Appartment: Identifiable {
    let id = UUID()
    var appartmentTitle: String
    var city: String
    var cost: Int
}

class MaxByViewModel: ObservableObject {
    @Published var appartment: [Appartment] = []
    @Published var minCost = 0
    @Published var maxCost = 0
    
    func fetch() {
        let inputData = [
            Appartment(appartmentTitle: "Appartment 1", city: "Kyiv", cost: 15_000),
            Appartment(appartmentTitle: "Appartment 2", city: "Odesa", cost: 12_000),
            Appartment(appartmentTitle: "Appartment 3", city: "Lviv", cost: 13_000)
        ]
        
        appartment = inputData
        _ = inputData.publisher
            .max(by: { (currentValue, nextValue) -> Bool in
                return currentValue.cost < nextValue.cost
            })
            .sink { [unowned self] appartment in
                maxCost = appartment.cost
            }
        
        _ = inputData.publisher
            .max { $0.cost > $1.cost } // short version
            .sink { [unowned self] appartment in
                minCost = appartment.cost
            }
    }
}
