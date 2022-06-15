//
//  JustViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 15.06.2022.
//

import Foundation
import Combine

// Makes from any variable a publisher. Send it to pipeline one time and stop the pipeline.

class JustViewModel: ObservableObject {
    @Published var winner = ""
    @Published var listOfPlayers: [String] = []
    
    func fetch() {
        let inputData = ["Player 1", "Player 2", "Player 3", "Player 4"]
        
        _ = inputData.publisher
            .sink { [unowned self] item in
                listOfPlayers.append(item)
            }
        
        if inputData.count > 0 { //
            Just(inputData[2])
                .map { item in
                    item.uppercased()
                }
                .assign(to: &$winner)
        }
    }
}
