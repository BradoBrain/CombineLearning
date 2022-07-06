//
//  AssignToViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 04.07.2022.
//

import Foundation
import Combine

// .assign(to: ) - subscriber that get value and directly assigns it to a @Publisher property. It works with pulished property.

class AssignToViewModel: ObservableObject {
    @Published var city = "Kyiv"
    @Published var greeting = ""
    
    init() {
        $city // Every time when the city is changed, the greeting will be automaticly updated
            .map { self.greetingCity(with: $0) }
            .assign(to: &$greeting)
    }
    
    func greetingCity(with city: String) -> String {
        let localTime = Calendar.current.component(.hour, from: Date())
        var prefix = ""
        
        switch localTime {
        case 6..<12: prefix = "Good Morning, "
        case 12..<18: prefix = "Good Afternoon, "
        case 18...23: prefix = "Good Evening, "
        default: prefix = "Good Night, "
        }
        
        return prefix + city
    }
}
