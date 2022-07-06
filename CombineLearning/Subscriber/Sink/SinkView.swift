//
//  SinkView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 06.07.2022.
//

import SwiftUI

struct SinkView: View {
    @StateObject var vm = SinkViewModel()
    
    var body: some View {
        VStack {
            List {
                Section(header: Text("From A to M")) {
                    ForEach(vm.aM, id: \.self) { Text($0) }
                }
                
                Section(header: Text("From N to Z")) {
                    ForEach(vm.nZ, id: \.self) { Text($0) }
                }
            }
            
            Button("Get Name") { vm.fetchRandomName() }
        }
    }
}

struct SinkView_Previews: PreviewProvider {
    static var previews: some View {
        SinkView()
    }
}
