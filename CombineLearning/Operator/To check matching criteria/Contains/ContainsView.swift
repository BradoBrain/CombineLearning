//
//  ContainsView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 19.06.2022.
//

import SwiftUI

struct ContainsView: View {
    @StateObject var vm = ContainsViewModel()
    
    var body: some View {
        VStack {
            Text("Your Order Details:").bold()
            
            
            List {
                Section(header: Text("Main information")) {
                    Text(vm.description)
                }
                
                Section(header: Text("Additional information")) {
                    Toggle("Acoustic", isOn: $vm.acoustic)
                    Toggle("Electric", isOn: $vm.electric)
                    Toggle("6 Strings", isOn: $vm.sixStrings)
                    Toggle("7 Strings", isOn: $vm.sevenStrings)
                    Toggle("8 Strings", isOn: $vm.eightStrings)
                }
            }
        }
        .onAppear {
            vm.fetch()
        }
    }
}

struct ContainsView_Previews: PreviewProvider {
    static var previews: some View {
        ContainsView()
    }
}
