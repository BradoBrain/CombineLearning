//
//  FilterViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 26.06.2022.
//

import Foundation
import Combine
import UIKit

// .filter - operator that give us to republish data based on our criteria.

class FilterViewModel: ObservableObject {
    @Published var dataAfterFilter: [String] = []
    
    let inputData = ["name: Artem", "name: Oksana", "city: Kyiv", "city: Odesa"]
    
    private var cancellable: AnyCancellable?
    
    init() {
        filterData(criteria: " ") // let us to show all string data
    }
    
    func filterData(criteria: String) {
        dataAfterFilter = [] // To remove items that shows before filtering
        
        cancellable = inputData.publisher
            .filter { item -> Bool in
                item.contains(criteria)
            }
            .sink { [unowned self] value in
                dataAfterFilter.append(value)
            }
    }
}
