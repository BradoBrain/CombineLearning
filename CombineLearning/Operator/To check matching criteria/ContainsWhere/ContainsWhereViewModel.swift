//
//  ContainsWhereViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 19.06.2022.
//

import Foundation
import Combine
import UIKit

// .contains(where:) - operator gives us an additional clouser to specify our criteria. Very useful when the item aren't simple type like String and Int.
// Item that don't match criteria not published and when first item is match, true is published and pipeline is closed.
// If there are no matches at the end of items, false will be published and pipeline will be finished.

struct Fruit {
    var name = ""
    var nutritionalInfo = ""
}


class ContainsWhereViewModel: ObservableObject {
    @Published var fruitName = ""
    @Published var vitaminA = false
    @Published var vitaminB = false
    @Published var vitaminC = false
    
    func fetch() {
        let inputData = [Fruit(name: "Apple", nutritionalInfo: "Vitamin A, Vitamin C")]
        
       _ = inputData.publisher // Here we don't store cancellable and don't have to hold on to a reference of it
            .sink { [unowned self] fruit in
                fruitName = fruit.name
            }
        
        inputData.publisher // It just publishes true or false to the @Published property
            .contains(where: { fruit -> Bool in
                fruit.nutritionalInfo.contains("Vitamin A")
            })
            .assign(to: &$vitaminA)
        
        inputData.publisher
            .contains(where: { fruit -> Bool in
                fruit.nutritionalInfo.contains("Vitamin B")
            })
            .assign(to: &$vitaminB)
        
        inputData.publisher
            .contains { fruit -> Bool in // we can remove parentheses and it will be still working
                fruit.nutritionalInfo.contains("Vitamin C")
            }
            .assign(to: &$vitaminC)
    }
}
