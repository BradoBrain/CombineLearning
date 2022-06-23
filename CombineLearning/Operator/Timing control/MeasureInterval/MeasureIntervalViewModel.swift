//
//  MeasureIntervalViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 23.06.2022.
//

import Foundation
import Combine

// .measureInterval - operator that tell us how much time was between one item and another one. It won't republish item values.

class MeasureIntervalViewModel: ObservableObject {
    @Published var interval: TimeInterval = 0.0
    
    var timeEvent = PassthroughSubject<Void, Never>()
    
    var cancellable: AnyCancellable?
    
    init() {
        cancellable = timeEvent
            .measureInterval(using: RunLoop.main)
            .sink { [unowned self] value in
                interval = value.magnitude
            }
    }
}
