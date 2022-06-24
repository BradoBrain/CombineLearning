//
//  ThrottleViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 24.06.2022.
//

import Foundation
import Combine

// .throttle - operator that set an interval and republishes just one value out of many we received during this interval.
// We have choise to republish recent value or first.

class ThrottleViewModel: ObservableObject {
    @Published var data: [String] = []
    
    var throttleValue: Double = 0.5
    
    var cancellable: AnyCancellable?
    let timeFormatter = DateFormatter()
    
    init() {
        timeFormatter.dateFormat = "HH:mm:ss:SSS"
    }
    
    func start() {
        if cancellable != nil {
            cancellable = nil
        } else {
            cancellable = Timer // we use Timer publisher to emit values every 0.2 seconds
                .publish(every: 0.2, on: .main, in: .common)
                .autoconnect()
                .throttle(for: .seconds(throttleValue), scheduler: RunLoop.main, latest: true) // We set true to republish last value during the interval
                .map { [unowned self] data in
                    timeFormatter.string(from: data)
                }
                .sink { [unowned self] data in
                    self.data.append(data)
                }
        }
    }
    
    func reset() {
        data.removeAll()
    }
}
