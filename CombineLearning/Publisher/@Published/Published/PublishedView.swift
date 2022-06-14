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
        VStack(alignment: .leading, spacing: 15) {
            
            TextField("Enter a name", text: $vm.userName)
                .textFieldStyle(.roundedBorder)
            
            Text(vm.validated)
                .font(.callout)
                .foregroundColor(vm.userValidationColor)
                .opacity(vm.userName.count < 1 ? 0 : 1)
            
        } .padding()
    }
}

struct Published_Previews: PreviewProvider {
    static var previews: some View {
        PublishedView()
    }
}

