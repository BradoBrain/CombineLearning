//
//  LastWhereViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 02.07.2022.
//

import Foundation
import Combine

// .last(where: ) - operator that give us the last item which matches our criteria.

struct Alien: Hashable {
    var name = ""
    var gender = ""
    var planet = ""
}

class LastWhereViewModel: ObservableObject {
    @Published var dataForView: [Alien] = []
    @Published var lastManFromEarth = ""
    
    func fetch() {
        let inputData = [Alien(name: "Matt", gender: "man", planet: "Mars"),
        Alien(name: "Alex", gender: "non-binary", planet: "Venus"),
        Alien(name: "Rod", gender: "man", planet: "Earth"),
        Alien(name: "Elaf", gender: "female", planet: "Mercury"),
        Alien(name: "Max", gender: "non-binary", planet: "Jupiter"),
        Alien(name: "Caleb", gender: "man", planet: "Earth"),
        Alien(name: "Ellen", gender: "female", planet: "Venus")]
        
        _ = inputData.publisher
            .sink { self.dataForView.append($0) }
        
        inputData.publisher
            .last(where: { $0.gender == "man" && $0.planet == "Earth" })
            .map { $0.name }
            .assign(to: &$lastManFromEarth)   
    }
}
