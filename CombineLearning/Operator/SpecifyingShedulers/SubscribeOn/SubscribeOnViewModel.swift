//
//  SubscribeOn.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 03.07.2022.
//

import Foundation
import Combine

// .subscribe(on: ) - operator that give us to suggest that work be done in the background for upstream publishers and operators.
// “Suggest” because subscribe(on:) does NOT guarantee that the work in operators will actually be performed in the background.

class SubscribeOnViewModel: ObservableObject {
    @Published var dataForView: [String] = []
    
    func fetch() {
        let inputData = ["Value 1", "Value 2", "Value 3", "Value 4", "Value 5"]
        
        _ = inputData.publisher
            .map { item  in
                print("is map on main thread? \(Thread.isMainThread)")
                return item
            }
            .handleEvents(receiveSubscription: { subscribtion in
                print("is receiveSubscription main thread? \(Thread.isMainThread)")
            }, receiveOutput: { item in
                print("is receiveOutput main thread? \(Thread.isMainThread)")
            }, receiveCompletion: { completion in
                print("is receiveCompletion main thread? \(Thread.isMainThread)")
            }, receiveCancel: {
                print("is receiveCancel main thread? \(Thread.isMainThread)")
            }, receiveRequest: { request in
                print("is receiveRequest main thread? \(Thread.isMainThread)")
            })
            .subscribe(on: DispatchQueue.global())
            .receive(on: DispatchQueue.main)
            .sink { self.dataForView.append($0) }
    }
}
