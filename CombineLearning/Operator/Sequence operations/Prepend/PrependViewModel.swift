//
//  PrependViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 22.06.2022.
//

import Foundation
import Combine

// .prepend - operator that publishes data first befor publisher will send out its first data

class PrependViewModel: ObservableObject {
    @Published var dataForView: [String] = []
    
    var cancellable: AnyCancellable?
    
    func fetch() {
        let inputData = ["Value 1", "Value 2", "Value 3"]
        
        cancellable = inputData.publisher
            .prepend("Add it befor the publish value")
            .sink { [unowned self] data in
                self.dataForView.append(data)
            }
    }
}
