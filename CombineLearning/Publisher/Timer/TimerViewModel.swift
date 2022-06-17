//
//  TimerViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 17.06.2022.
//

import Foundation
import Combine

// Timer publisher repeatedly publish current date and time with interval that you set up. You also could attach operators to run some code at an interval.

class TimerViewModel: ObservableObject {
    @Published var data: [String] = []
    @Published var interval: Double = 1
    
    private var timerCancellable: AnyCancellable?
    private var intervalCancellable: AnyCancellable?
    
    let timeFormatter = DateFormatter()
    
    init() {
        timeFormatter.dateFormat = "HH:mm:ss.SSS"
        
        intervalCancellable = $interval // When it changes value we can restart timer's pipeline
            .dropFirst()
            .sink { [unowned self] interval in // Restart timer pipeline
                timerCancellable?.cancel()
                data.removeAll()
                start()
            }
    }
    
    func start() {
        timerCancellable = Timer.publish(every: interval, on: .main, in: .common) // Set timer's interval with publisher modifier.
            .autoconnect() // To allow timer to automatically start publishing. We also can make it manually
            .sink { [unowned self] dataIn in
                data.append(timeFormatter.string(from: dataIn))
            }
    }
}
