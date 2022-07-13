//
//  BreakpointOnErrorViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 13.07.2022.
//

import Foundation
import Combine

// .breakpointOnError - it pause execution when we g=have any error

class BreakpointOnErrorViewModel: ObservableObject {
    @Published var dataForView: [String] = []
    
    func fetch() {
        let inputData = ["Value 1", "Value 2", "📛", "Value 3"]
        
        _ = inputData.publisher
            .tryMap { item in
                if item == "📛" {
                    throw SmileError()
                }
                return item
            }
            .breakpointOnError()
            .sink(receiveCompletion: { _ in
                print("Pipeline is completed")
            }, receiveValue: { self.dataForView.append($0)})
    }
}
