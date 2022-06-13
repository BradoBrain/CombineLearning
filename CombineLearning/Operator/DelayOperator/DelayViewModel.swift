//
//  DelayViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 13.06.2022.
//

import Foundation
import Combine

class DelayViewModel: ObservableObject {
    @Published var data = "Start Data"
    @Published var status = ""
    private var cancellable: AnyCancellable? // made it private in order only internal func cancel() sees this property
    
    init() {
        cancellable = $data
            .map { [unowned self] value -> String in // value -> String to set type for return from operator
                status = "In process..."
                return value
            }
            .delay(for: 5, scheduler: RunLoop.main) // to set 5 second delay and specifying that it will be on the main thread
            .sink { [unowned self] value in
                status = "Process has finished"
            }
    }
    
    func refresh() {
        data = "Data was refreshed"
    }
    
    func cancel() {
        status = "Cancelled"
        cancellable?.cancel() // or cancellable = nil
    }
    
}
