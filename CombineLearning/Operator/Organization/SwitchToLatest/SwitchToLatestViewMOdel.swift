//
//  SwitchToLatestViewMOdel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 11.07.2022.
//

import Foundation
import Combine

// .switchLatest - operator that give us to publishes just latest publisher and cancel others publishers (for example like .flatMap). It looks like .combineLatest but for publishers.

class SwitchToLatestViewMOdel: ObservableObject {
    @Published var names = ["Artem", "Demid", "Oksana", "Busya"]
    @Published var familyResult: [FamilyResult] = []
    
    var cancellables: Set<AnyCancellable> = []
    
    func fetch() {
        names.publisher
            .map { name -> (String, URL) in
                (name, URL(string: "https://api.genderize.io/?name=\(name)")!)
            }
            .map { (name, url) in
                URLSession.shared.dataTaskPublisher(for: url)
                    .map { $0.data }
                    .decode(type: FamilyResult.self, decoder: JSONDecoder())
                    .replaceError(with: FamilyResult(name: name, gender: "Error"))
                    .eraseToAnyPublisher()
            }
            .switchToLatest()
            .receive(on: DispatchQueue.main)
            .sink { self.familyResult.append($0) }
            .store(in: &cancellables)
    }
}
