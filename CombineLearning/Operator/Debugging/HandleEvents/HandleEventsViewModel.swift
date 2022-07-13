//
//  HandleEventsViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 13.07.2022.
//

import Foundation
import Combine

// .handleEvents - operator that can expose 5 different events and give you closures for each one so you can write debugging code or other code as you will see in the following examples.

class HandleEventsViewModel: ObservableObject {
    @Published var dataForView: [String] = []
    
    func fetch() {
        let inputData = ["Value 1", "Value 2", "Value N", "Value 3", "Value 4", "Value 5"]
        
        _ = inputData.publisher
            .handleEvents(receiveSubscription: { subscr in // These are optional events. Each one can be remove
                print("Receive Subscribtion")
            }, receiveOutput: { print("Receive output value \($0)")
            }, receiveCompletion: { completion in
                print("Receive completion")
            }, receiveCancel: {
                print("Receive cancel")
            }, receiveRequest: { demand in
                print("Receive request")
            })
            .tryMap { item in
               if item == "Value N" {
                    print("Error") }
                return item
            }
            .sink(receiveCompletion: { completion in
                print("Pipeline is completed")
            }, receiveValue: { self.dataForView.append($0) })
    }
}
