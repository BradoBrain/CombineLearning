//
//  DropUntilViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 21.06.2022.
//

import Foundation
import Combine

// .drop(untilOutputFrom: ) - operator that does not publishes or send items down to the pipeline until it receives items from second pipeline that will give a signal to accept the publishing.


class DropUntilViewModel: ObservableObject {
    @Published var data: [String] = []
    
    var startPublishing = PassthroughSubject<Bool, Never>()
    
    var cancellable: [AnyCancellable] = []
    let timeFormatter = DateFormatter()
    
    init() {
        timeFormatter.timeStyle = .long
        
        Timer.publish(every: 1, on: RunLoop.main, in: .common)
            .autoconnect()
            .drop(untilOutputFrom: startPublishing)
            .map { data in
                self.timeFormatter.string(from: data)
            }
            .sink { [unowned self] dataIn in
                data.append(dataIn)
            }
            .store(in: &cancellable)
    }
}
