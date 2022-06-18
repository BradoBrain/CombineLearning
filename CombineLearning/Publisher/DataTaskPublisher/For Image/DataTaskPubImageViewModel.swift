//
//  DataTaskPubImageViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 18.06.2022.
//

import Foundation
import SwiftUI // To get Image
import Combine

class DataTaskPubImageViewModel: ObservableObject {
    @Published var imageToView: Image?
    @Published var errorForAlert: ErrorToView?
    
    var cancellable: Set<AnyCancellable> = []
    
    func fetch() {
                      
        guard let url = URL(string: "https://support.apple.com/content/dam/edam/applecare/images/en_US/repair/applecare-products_2x.png") else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data } // short version to get data from tuple (data, response)
            .tryMap { data in // using .tryMap becouse of we have an error case
                guard let uiImage = UIImage(data: data) else {
                    throw ErrorToView(message: "Did not receive an image")
                }
                return Image(uiImage: uiImage)
            }
            .receive(on: RunLoop.main) // send it to main thread
            .sink(receiveCompletion: { [unowned self] completion in // looks for two different types of errors
                if case .failure(let error) = completion {
                    if error is ErrorToView {
                        errorForAlert = (error as! ErrorToView)
                    } else {
                        errorForAlert = ErrorToView(message: "See details: \(error.localizedDescription)")
                    }
                }
            }, receiveValue: { [unowned self] Image in
                imageToView = Image
            })
            .store(in: &cancellable)
    }
}
