//
//  IgnoreOutputViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 30.06.2022.
//

import Foundation
import Combine

// .ignoreOutput - operator that ignore anything that comes down pipeline (it will never reach a subscriber). Sink still detects when it is finished or failed

class IgnoreOutputViewModel: ObservableObject {
    @Published var dataForView: [String] = []
    @Published var reportAboutIgnoring: [String] = []
    
    func fetch() {
        let inputData = ["Value 1", "Value 2", "Value 3", "Value 4"]
        
        _ = inputData.publisher
            .sink { self.dataForView.append($0) }
        
        _ = reportAboutIgnoring.publisher
            .ignoreOutput()
            .sink(receiveCompletion: { _ in
                self.reportAboutIgnoring.append("Pipeline has been finished")
            }, receiveValue: { _ in
                self.reportAboutIgnoring.append("We won't see this text")
            })
    }
}
