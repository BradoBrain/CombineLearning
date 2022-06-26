//
//  MapViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 26.06.2022.
//

import Foundation
import Combine

// .map - operator that give us to inspect items coming through and validate them, update to something else or even change the type of the items.
// We can do anything we want within it.

class MapViewModel: ObservableObject {
    @Published var dataForView1: [String] = []
    @Published var dataForView2: [String] = []
    
    let inputData = ["pencil", "trash", "folder", "paperplane"]
    
    func fetch() {
        
        _ = inputData.publisher
            .map {
                "😎" + $0.uppercased()
            }
            .sink { [unowned self] item in
                dataForView1.append(item)
            }
    }
    
    func fetch2() {
        _ = inputData.publisher
            .map { $0 }
            .sink { self.dataForView2.append($0) }
    }
}
