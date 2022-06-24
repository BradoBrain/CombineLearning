//
//  TimeOutViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 24.06.2022.
//

import Foundation
import Combine

// We can finish the pipeline when task process is too long

struct TimeOutError: Error, Identifiable {
    let id = UUID()
    let title = "Time Out"
    let message = "Please try again"
}

class TimeOutViewModel: ObservableObject {
    @Published var dataForView: [String] = []
    @Published var isFetched = false
    @Published var timeError: TimeOutError?
    
    var cancellable: AnyCancellable?
    
    func fetch() {
        isFetched = true
        
        let url = URL(string: "https://apple.com/nothing")! // We use fake link to delay fetching
        
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .timeout(.seconds(1), scheduler: RunLoop.main, customError: { URLError(.timedOut) })
            .map { $0.data }
            .decode(type: String.self, decoder: JSONDecoder())
            .sink(receiveCompletion: { [unowned self] completion in
                isFetched = false
                
                if case .failure (URLError.timedOut) = completion {
                    timeError = TimeOutError()
                }
            }, receiveValue: { [unowned self] value in
                dataForView.append(value)
            })
    }
}
