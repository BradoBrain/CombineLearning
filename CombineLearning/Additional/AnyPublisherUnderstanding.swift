//
//  AnyPublisher.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 07.07.2022.
//

import SwiftUI
import Combine

// The AnyPublisher object can represent, well, any publisher or operator. (Operators are a form of publishers.) When you create pipelines and want to store them in properties or return them from functions, their resulting types can bet pretty big because you will find they are nested. You can use AnyPublisher to turn these seemingly complex types into a simpler type.

class AnyPublisherViewModelUnderstanding: ObservableObject {
    /*
     func publisher(url: URL) ->
     Publishers.ReplaceError<Publishers.Concatenate<Publishers.S
     equence<[String], Error>,
     Publishers.ReceiveOn<Publishers.Decode<Publishers.Map<URLSe
     ssion.DataTaskPublisher, JSONDecoder.Input>, String,
     JSONDecoder>, RunLoop>>> {
     return URLSession.shared.dataTaskPublisher(for: url)
     .map { (data: Data, response: URLResponse) in
     }
     data
     .decode(type: String.self, decoder: JSONDecoder())
     .receive(on: RunLoop.main)
     .prepend("AWAY TEAM")
     .replaceError(with: "No players found")
     */
    
    // We can use code like this insted code above
    func publisher(url: URL) -> AnyPublisher<String, Never> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { (data: Data, response: URLResponse) in
                data
            }
            .decode(type: String.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .prepend("AWAY TEAM")
            .replaceError(with: "No players found")
            .eraseToAnyPublisher() // We add the operator to the end os pipeline to simplify return type
        
    }
}

