//
//  TryContainsWhereView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 19.06.2022.
//

import SwiftUI

struct TryContainsWhereView: View {
    @StateObject var vm = TryContainsWhereViewModel()
    
    var body: some View {
        VStack {
            Text("Looking For strong people in:").bold()
            
            Picker("City", selection: $vm.city) {
                Text("Lviv").tag("Lviv")
                
                Text("Kyiv").tag("Kyiv")
                
                Text("Odesa").tag("Odesa")
                
                Text("Budapest").tag("Budapest")
                
                Text("Huilostan").tag("Huilostan")
            } .pickerStyle(.segmented)
            
            Text("Result: \(vm.result)") .padding()
            
            Button("Search") { vm.search() } .buttonStyle(.borderedProminent).padding()
        } .alert(item: $vm.selectionError, content: { _ in
            Alert(title: Text("Error"), message: Text("There are no normal people here"))
            })
    }
}

struct TryContainsWhereView_Previews: PreviewProvider {
    static var previews: some View {
        TryContainsWhereView()
    }
}
