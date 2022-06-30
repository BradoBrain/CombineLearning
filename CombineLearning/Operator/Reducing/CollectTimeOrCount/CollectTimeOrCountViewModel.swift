//
//  CollectTimeOrCountViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 30.06.2022.
//

import Foundation
import Combine

// .collect(by: Time or Count) - we can set it by interval and count and when one of the limits is reashed the items collected will be published.

class CollectTimeOrCountViewModel: ObservableObject {
    @Published var collection: [[String]] = []
    
    var cancellable: AnyCancellable?
    
    func fetch() {
        collection.removeAll()
        cancellable?.cancel()
        
        cancellable = Timer.publish(every: 0.1, on: .main, in: .common)
            .autoconnect()
            .map { _ in "⏱"}
            .collect(.byTimeOrCount(RunLoop.main, .seconds(1), 4)) // 4 is count
            .sink { [unowned self] collect in
                collection.append(collect)
            }
    }
}
