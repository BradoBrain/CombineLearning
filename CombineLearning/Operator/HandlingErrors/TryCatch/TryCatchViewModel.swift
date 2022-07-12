//
//  TryCatchViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 12.07.2022.
//

import Foundation
import Combine

// .tryCatch - operator like .catch but has option to throw an error

class TryCatchViewModel: ObservableObject {
    @Published var dataForView: [String] = []
    @Published var smileError: SmileError?
    
    func fetch() {
        let inputData = ["Value 1", "Value 2", "📛", "Value 4"]
        
        _ = inputData.publisher
            .tryMap { item in
                if item == "📛" { throw SmileError() }
                return item
            }
            .tryCatch { [unowned self] error in
                fetchAnotherData()
            }
            .sink(receiveCompletion: { [unowned self] completion in
                if case .failure(let err) = completion {
                    self.smileError = err as? SmileError
                }
            }, receiveValue: { self.dataForView.append($0) })
    }
    
    private func fetchAnotherData() -> AnyPublisher<String, Error> {
        ["Another value 1", "Another value 2", "📛"].publisher
            .tryMap { item in
                if item == "📛" { throw SmileError() }
                return item
            }
            .eraseToAnyPublisher()
    }
}
