//
//  CancellableView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 13.06.2022.
//

import SwiftUI

struct CancellableView: View {
    @StateObject var vm = CancellableViewModel()
    
    var body: some View {
        VStack(spacing: 15) {
            TextField("Enter a name", text: $vm.name)
                .textFieldStyle(.roundedBorder)
            
            Text(vm.validated)
                .padding()
                .foregroundColor( !vm.name.isEmpty ? .green : .red)
                .background(Circle().foregroundColor(.gray).opacity(0.5))
            
            Button("Cancel") {
                vm.validated = ""
                vm.cancellable?.cancel()
            } // validated will be work till Cancel button is not tapped. If it is tapped The flow will be stopped
            
        } .padding()
    }
}

struct CancellableView_Previews: PreviewProvider {
    static var previews: some View {
        CancellableView()
    }
}
