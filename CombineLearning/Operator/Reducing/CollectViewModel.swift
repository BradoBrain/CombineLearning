//
//  CollectViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 29.06.2022.
//

import Foundation
import Combine

// .collect - operator that does not let items pass through the pipeline. Instead, it puts all items into an array, and then when the pipeline finishes it will publish the array.

class CollectViewModel: ObservableObject {
    @Published var dataForView: [String] = []
    @Published var circle = false
    
    var cach: [Int] = []
    var cancellable: Set<AnyCancellable> = []
    
    init() {
        $circle
            .sink { [unowned self] shape in formatData(shape: shape ? "circle" : "square") }
            .store(in: &cancellable)
    }
    
    func fetch() {
        cach = Array(1...30)
        formatData(shape: circle ? "circle" : "square")
    }
    
    func formatData(shape: String) {
        cach.publisher
            .map { item in
             return "\(item).\(shape)"
            }
            .collect()
            .assign(to: &$dataForView)
    }
}
