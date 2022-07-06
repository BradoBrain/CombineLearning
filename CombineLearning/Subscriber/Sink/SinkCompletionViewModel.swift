//
//  SinkCompletionViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 06.07.2022.
//

import Foundation
import Combine

class SinkCompletionViewModel: ObservableObject {
    @Published var data = ""
    @Published var isProcessing = false
    
    var cancellable: Set<AnyCancellable> = []
    
    func fetch() {
        isProcessing = true
        
        data = ""
        
        [10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0].publisher
            .delay(for: 1, scheduler: RunLoop.main)
            .sink { [unowned self] completion in // here also could be error block but we need to have .tryMap operator before
                isProcessing = false
            } receiveValue: { self.data = self.data.appending(String($0) + " ") }
            .store(in: &cancellable)
    }
}
