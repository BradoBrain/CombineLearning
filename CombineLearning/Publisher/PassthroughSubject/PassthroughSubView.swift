//
//  PassthroughSubView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 16.06.2022.
//

import SwiftUI

struct PassthroughSubView: View {
    @StateObject var vm = PassthroughSubViewModel()
    
    var body: some View {
        VStack(spacing: 25) {
            HStack {
                TextField("Enter a phone number", text: $vm.phoneNumber)
                    .textFieldStyle(.roundedBorder)
                Group {
                    switch vm.status {
                    case .ok: Image(systemName: "checkmark.circle.fill").foregroundColor(.green)
                    case .invalid: Image(systemName: "x.circle.fill").foregroundColor(.red)
                    default: Image(systemName: "x.circle.fill").foregroundColor(.red).opacity(0)
                    }
                }
            }
            
            Button("Verify a phone number") {
                vm.verifyPhoneNumber.send(vm.phoneNumber) // Into this we also have a send() func that will sen the value throur the pipeline
            }
            
        }
        .padding()
    }
}

struct PassthroughSubView_Previews: PreviewProvider {
    static var previews: some View {
        PassthroughSubView()
    }
}
