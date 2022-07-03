//
//  ReceiveOn.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 03.07.2022.
//

import Foundation
import Combine
import SwiftUI

// .receive(on: ) - operator that give us to specify thread and how work is done.

struct AlertError: Error, Identifiable {
    let id = UUID()
    let message = "Somthing went wrong!"
}

class ReceiveOnViewModel: ObservableObject {
    @Published var errorImage = Image("noImage")
    @Published var error: AlertError?
    
    var cancellable: Set<AnyCancellable> = []
    
    func fetch() {
        let url = URL(string: "https://http.cat/401")!
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .tryMap { data in
                guard let uiImage = UIImage(data: data) else {
                    throw AlertError()
                }
                return Image(uiImage: uiImage)
            }
            .receive(on: RunLoop.main)
            .sink { [unowned self] completion in
                if case .failure(let err) = completion {
                    error = err as? AlertError
                }
            } receiveValue: { self.errorImage = $0 }
            .store(in: &cancellable)
    }
}
