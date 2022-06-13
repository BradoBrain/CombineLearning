//
//  Published.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 13.06.2022.
//

import SwiftUI


struct PublishedView: View {
    // We subscribe the view to ObservableObject by @StateObject
    @StateObject var vm = PublishedViewModel()
    
    var body: some View {
        VStack(spacing: 15) {
            TextField("Enter a name", text: $vm.name)
                .textFieldStyle(.roundedBorder)
            
            Text(vm.validated)
                .padding()
                .foregroundColor( !vm.name.isEmpty ? .green : .red)
                .background(Circle().foregroundColor(.gray).opacity(0.5))
            
        } .padding()
    }
}

struct Published_Previews: PreviewProvider {
    static var previews: some View {
        PublishedView()
    }
}

