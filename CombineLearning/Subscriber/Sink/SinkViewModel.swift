//
//  SinkViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 06.07.2022.
//

import Foundation
import Combine

// .sink - subscriber that allow us to just receive values and do what we want with them. We also can get completes and error.

class SinkViewModel: ObservableObject {
    @Published var name = ""
    @Published var aM = [String]()
    @Published var nZ = [String]()
    
    var cancellable: AnyCancellable?
    
    let names = ["Artem", "Oksana", "Demid", "Zahar", "Vika", "Andrey"]
    
    init() {
        cancellable = $name
            .dropFirst() // we skip "" value of name
            .sink { [unowned self] name in
                let firstSymbol = name.prefix(1)
                
                (firstSymbol < "M") ? aM.append(name) : nZ.append(name)
            }
    }
    
    func fetchRandomName() {
        guard let random = names.randomElement() else { return }
        name = random
    }
}
