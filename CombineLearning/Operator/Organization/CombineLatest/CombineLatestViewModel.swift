//
//  CombineLatestViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 08.07.2022.
//

import Foundation
import Combine
import SwiftUI

// .combineLastest - operator we can connect two or more pipelines and then use a closure to process the latest data received from each publisher in some way. There is also a .combineLatest to connect 3 or even 4 pipelines together. You will still have just one pipeline after connecting all of the publishers

struct ShapeData: Identifiable {
    let id = UUID()
    var image = ""
    var color = Color.clear
}

class CombineLatestViewModel: ObservableObject {
    @Published var shapeData = ShapeData()
    
    func fetch() {
        let images = ["pencil.circle", "folder.circle", "paperplane.circle"]
        let colors = [Color.blue, Color.orange, Color.green, Color.purple]
        
        _ = images.publisher
            .combineLatest(colors.publisher) { ShapeData(image: $0, color: $1) }
            .sink { self.shapeData = $0 }
    }
}
