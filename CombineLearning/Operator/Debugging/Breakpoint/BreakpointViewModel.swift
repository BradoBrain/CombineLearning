//
//  BreakpointViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 13.07.2022.
//

import Foundation
import Combine

// .breakpoint - operator that give us to set condition to have the app break during execution.

class BreakpointViewModel: ObservableObject {
    @Published var dataForView: [String] = []
    
    func fetch() {
        let inputData = ["Artem", "Demid", "Oksana", "%data", "Busya"]
        
        _ = inputData.publisher
            .breakpoint(receiveSubscription: { subscription in
                print("Subscriber has been connected")
                return false // we set true if we want to pause execution
            }, receiveOutput: { output in
                print("Get wrong value \(output)")
                return output.contains("%")
            }, receiveCompletion: { completion in
                print("Pipeline is about to complete")
                return false
            })
            .sink(receiveCompletion: { completion in
                print("Pipeline has been finished")
            }, receiveValue: { self.dataForView.append($0) })
    }
}
