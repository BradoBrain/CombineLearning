//
//  PropertiesAndFunction.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 07.07.2022.
//

import SwiftUI
import Combine

class PropertiesAndFunctionViewModel: ObservableObject {
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var family: [String] = []
    
    var firstNamePublisher = Just("Brado") // an example of just storing a publisher in properties
    var lastNameUpper: Just<String> {
        Just("Brain")
            .map { $0.uppercased() }
    }
    
    func familyPipeline(uppercased: Bool) -> AnyCancellable {
        ["Artem", "Demid", "Oksana", "Busya"].publisher
            .map { uppercased ? $0.uppercased() : $0 }
            .sink { self.family.append($0) }
    }
    
    func fetch() {
        firstNamePublisher
            .map { $0.uppercased() }
            .assign(to: &$firstName)
        
        lastNameUpper
            .assign(to: &$lastName)
        
        _ = familyPipeline(uppercased: false)
    }
}

struct PropertiesAndFunction: View {
    @StateObject var vm = PropertiesAndFunctionViewModel()
    
    var body: some View {
        VStack {
            
            Text("\(vm.lastName), \(vm.firstName)")
                .font(.largeTitle)
            
            List {
                Section(header: Text("My family")) {
                    ForEach(vm.family, id: \.self) { Text($0) }
                }
            } .listStyle(PlainListStyle())
        }
        .onAppear { vm.fetch() }
    }
}

struct PropertiesAndFunction_Previews: PreviewProvider {
    static var previews: some View {
        PropertiesAndFunction()
    }
}
