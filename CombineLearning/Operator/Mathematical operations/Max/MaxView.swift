//
//  MaxView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 20.06.2022.
//

import SwiftUI

struct MaxView: View {
    @StateObject var vm = MaxViewModel()
    
    var body: some View {
        VStack {
            List {
                Section(header: Text("Which word is max?"), footer: Text("Max is: \(vm.maxString)").bold()) {
                    ForEach(vm.stringArray, id: \.self) { item in
                        Text(item)
                    }
                }
                
                Section(header: Text("Which age is max?"), footer: Text("Max is: \(vm.maxInt)").bold()) {
                    ForEach(vm.intArray, id: \.self) { item in
                        Text("\(item)")
                    }
                }
            }
        }
        .onAppear() {
            vm.fetch()
        }
    }
}

struct MaxView_Previews: PreviewProvider {
    static var previews: some View {
        MaxView()
    }
}
