//
//  FutureView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 14.06.2022.
//

import SwiftUI

struct FutureView: View {
    @StateObject var vm = FutureViewModel()
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Spacer()
            
            HStack {
                Text("Name is: \(vm.name)")
                
                Spacer()
                
                Button("Get Name") { vm.getName() } .buttonStyle(.borderedProminent)
            }
            
            HStack {
                Text("Surname is: \(vm.surname)")
                
                Spacer()
                
                Button("Get Surname") { vm.getSurname() } .buttonStyle(.borderedProminent)
            }
            
            Button("Cancel getting Surname") {vm.cancellable?.cancel()} .buttonStyle(.borderedProminent)
            
            Spacer()
        } .padding()
    }
}

struct FutureView_Previews: PreviewProvider {
    static var previews: some View {
        FutureView()
    }
}
