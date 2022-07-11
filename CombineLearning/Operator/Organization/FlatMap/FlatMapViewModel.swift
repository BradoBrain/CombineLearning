//
//  FlatMapViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 09.07.2022.
//

import Foundation
import Combine
import UIKit

// .flatMap - operator that give us to have publisher withing a publisher

struct FamilyResult: Decodable {
    var name = ""
    var gender = ""
    var probability = 0.0
}

class FlatMapViewModel: ObservableObject {
    @Published var names = ["Artem", "Oksana", "Demid", "Busya"]
    @Published var nameResult: [FamilyResult] = []
    
    var cancellables: Set<AnyCancellable> = []
    
    func fetch() {
        nameResult.removeAll()
        
        names.publisher
            .map { name -> (String, URL) in
                (name, URL(string: "https://api.genderize.io/?name=\(name)")!)
            }
        //            .flatMap { (name, url) -> AnyPublisher<FamilyResult, Never> in
            .flatMap(maxPublishers: Subscribers.Demand.max(1)) { (name, url) -> AnyPublisher<FamilyResult, Never> in
                // with max(value) we create conctraint for number of publishing value
                URLSession.shared.dataTaskPublisher(for: url)
                    .map { $0.data }
                    .decode(type: FamilyResult.self, decoder: JSONDecoder())
                    .replaceError(with: FamilyResult(name: name, gender: "Error"))
                    .eraseToAnyPublisher()
            }
            .receive(on: DispatchQueue.main)
            .sink { self.nameResult.append($0) }
            .store(in: &cancellables)
    }
}
