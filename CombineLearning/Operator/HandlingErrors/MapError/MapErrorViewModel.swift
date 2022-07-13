//
//  MapErrorViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 12.07.2022.
//

import Foundation
import Combine

// .mapError - operator which allow usa central place to catch errors before subscriber and give us a clouser to throw new error.

struct TODO: Identifiable, Decodable {
    let id: Int
    var title: String
    var completed: Bool // For example if we change the value name it will be error "Could not decode data"
}

struct ErrorForMapError: Identifiable, Error {
    let id = UUID()
    var message = ""
}

enum UrlResponseError: String, Error {
    case unowned = "It is not recognized"
    case clientError = "Could not get data"
    case serverError = "Problem on server side"
    case decoderError = "Could not decode data"
}

class MapErrorViewModel: ObservableObject {
    @Published var dataForView: [TODO] = []
    @Published var error: ErrorForMapError?
    
    var cancellable: AnyCancellable?
    
    func fetch() {
        let url = URL(string: "https://jsonplaceholder.typicode.com/users/1/todos")!
        
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { (data: Data, response: URLResponse) -> Data in
                guard let httpResponse = response as? HTTPURLResponse else { throw UrlResponseError.unowned }
                if (400..<500).contains(httpResponse.statusCode) { throw UrlResponseError.clientError }
                if (500..<600).contains(httpResponse.statusCode) { throw UrlResponseError.serverError }
                return data
            }
            .decode(type: [TODO].self, decoder: JSONDecoder())
            .mapError { err -> UrlResponseError in
                if let responseError = err as? UrlResponseError {
                    return responseError
                } else {
                    return UrlResponseError.decoderError
                }
            }
            .receive(on: RunLoop.main)
            .sink { [unowned self] completion in
                if case .failure(let errors) = completion {
                    self.error = ErrorForMapError(message: errors.rawValue)
                }
            } receiveValue: { self.dataForView = $0 }
    }
}
