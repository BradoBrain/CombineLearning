//
//  CollectByCountViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 29.06.2022.
//

import Foundation
import Combine

// .collect(by: count) - operator that can get a number and putting items into an array until that number. It will continue to do this until pipeline finishes.

class CollectByCountViewModel: ObservableObject {
    @Published var valuesGroupsSize = 3.0
    @Published var groups: [[String]] = []
    
    var values: [String] = []
    var cancellable: Set<AnyCancellable> = []
    
    init() {
        $valuesGroupsSize
            .sink { [unowned self] in createGroup(with: Int($0))}
            .store(in: &cancellable)
    }
    
    func fetch() {
        values = ["Value 1", "Value 2", "Value 3", "Value 4", "Value 5", "Value 6", "Value 7", "Value 8", "Value 9"] // add the data to our values array
        
        createGroup(with: Int(valuesGroupsSize))
    }
    
    func createGroup(with size: Int) {
        groups.removeAll()
        
        _ = values.publisher
            .collect(size)
            .sink { [unowned self] value in
                groups.append(value)
            }
    }
}
