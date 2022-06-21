//
//  AppendViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 21.06.2022.
//

import Foundation
import Combine

// .append - operator that publishes the data after the publisher has sent out all of its items. It add items to the end.

class AppendViewModel: ObservableObject {
    @Published var dataForView: [String] = []
    
    var cancellable: AnyCancellable?
    
    func fetch() {
        let inputData = ["Kyiv", "Kharkiv", "Lviv", "Odesa", "Mariupol", "Kherson"]
        
        cancellable = inputData.publisher
            .append("* - and others cities of Ukraine")
            .sink { [unowned self] data in
                self.dataForView.append(data)
            }
    }
}
