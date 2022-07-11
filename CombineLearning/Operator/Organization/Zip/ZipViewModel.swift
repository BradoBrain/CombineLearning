//
//  ZipViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 11.07.2022.
//

import Foundation
import Combine
import SwiftUI

// .zip - operator that connect two pipelines and then uses a clouser to process the data. There are also .zip3, .zip4 to connect more pipelines.

class ZipViewModel: ObservableObject {
    @Published var dataForView: [ShapeData] = []
    
    func fetch() {
        let images = ["pencil.circle", "folder.circle", "paperplane.circle"]
        let colors = [Color.blue, Color.orange, Color.green]
        
        _ = images.publisher
            .zip(colors.publisher) {  ShapeData(image: $0, color: $1) }
            .sink { self.dataForView.append($0) }
    }
}
