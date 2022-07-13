//
//  RetryViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 13.07.2022.
//

import Foundation
import Combine

// .retry - operator that does not give the subscriber get error and send it back to publisher to try send it again number of time we specify.

class RetryViewModel: ObservableObject {
    @Published var linkData = ""
    private var cancellable: AnyCancellable?
    
    func fetch() {
        let url = URL(string: "https://oidutsniatnuomgib.com/")
        
        cancellable = URLSession.shared.dataTaskPublisher(for: url!)
            .retry(3)
            .map { String(data: $0.data, encoding: .utf8) ?? "No data" }
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [unowned self] completion in
                if case .failure = completion {
                    linkData = "We made 4 attempts to retrieve the page and failed"
                }
            }, receiveValue: { self.linkData = $0 })
    }
}
