//
//  CancellableViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 13.06.2022.
//

import Foundation
import Combine // Now we need to import Combine

class CancellableViewModel: ObservableObject {
    @Published var name = ""
    @Published var validated: String = ""
    var cancellable: AnyCancellable?
    
    init() {
       cancellable = $name // Here is our CANCELLABLE publisher. If we don't use AnyCancellable, we will get unused .sink
        // if we want to get cancel only one time we can use code like this _ = $name
            .map { name in
                name.isEmpty ? "X" : "V"
            } // Here is still our operator
            .sink{ [unowned self] value in // subscriber that has way to stop flow of data (handle)
                self.validated = value
            } // This subscriber returns us AnyCancellable class which has one function in its protocol Cancellable - cancel()
    }
}
