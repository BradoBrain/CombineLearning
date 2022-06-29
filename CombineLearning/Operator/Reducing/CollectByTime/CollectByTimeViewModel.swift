//
//  CollectByTimeViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 29.06.2022.
//

import Foundation
import Combine

// .collect(by: time) - operator that gets a time interval. During the interval it adds the items to an array

class CollectByTimeViewModel: ObservableObject {
    @Published var interval = 1.0
    @Published  var collection: [[String]] = []
    
    var cancellable: Set<AnyCancellable> = []
    var timerCancellable: AnyCancellable?
    
    init() {
        $interval
            .sink { [unowned self] _ in fetch() } // Everi time when interval changes it will be calling fetch()
            .store(in: &cancellable)
    }
    
    func fetch() {
        collection.removeAll()
        timerCancellable?.cancel()
        
        timerCancellable = Timer.publish(every: 0.1, on: .main, in: .common)
            .autoconnect()
            .map { _ in "⏱"} // it will be replacing anything that comes down the pipeline with ⏱
            .collect(.byTime(RunLoop.main, .seconds(interval)))
            .sink { [unowned self] collect in
                collection.append(collect)
            }
    }
}
