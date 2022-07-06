//
//  AssignToView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 04.07.2022.
//

import SwiftUI

struct AssignToView: View {
    @StateObject var vm = AssignToViewModel()
    
    var body: some View {
        VStack {
            Text(vm.greeting)
            
            TextField("Enter a city name", text: $vm.city)
                .padding()
                .textFieldStyle(.roundedBorder)
        }
    }
}

struct AssignToView_Previews: PreviewProvider {
    static var previews: some View {
        AssignToView()
    }
}
