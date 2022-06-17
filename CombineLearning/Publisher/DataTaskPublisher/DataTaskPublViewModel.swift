//
//  DataTaskPublViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 17.06.2022.
//

import Foundation
import Combine

// To get data from an URL we can use URLSession that has a DataTaskPublisher (it can send a results of a URL API down a pipeline and assign results to a property)

// DataTaskPublisher can retutn:
// Data - represents as bites in memory
// Response - status of how our call went
// Error...

// Make a Model to get information

struct Model: Decodable {
    var _id: String
    let text: String
}

class DataTaskPublViewModel: ObservableObject {
    @Published var dataForView: [Model] = []
    var cancellable: Set<AnyCancellable> = []
    
    func fetch() {
        guard let url = URL(string: "https://cat-fact.herokuapp.com/facts") else { return }
        URLSession.shared.dataTaskPublisher(for: url)
            .map { (data: Data, response: URLResponse) in // here is our tuple Data + Response
                data                                      // Then .map get the tuple it republish only one value
            }
            .decode(type: [Model].self, decoder: JSONDecoder()) // To decode our Model struct from bytes to our JSON like a Model fields
            .receive(on: RunLoop.main) // Here we move our data from background pipeline to new foreground thread
            .sink(receiveCompletion: { completion in
                print(completion) // Here is our error if we get it
            }, receiveValue: { [unowned self] dataFromModel in
                dataForView = dataFromModel
            })
            .store(in: &cancellable)
        
    }
}
