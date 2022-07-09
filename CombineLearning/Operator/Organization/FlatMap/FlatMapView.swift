//
//  FlatMapView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 09.07.2022.
//

import SwiftUI

struct FlatMapView: View {
    @StateObject var vm = FlatMapViewModel()
    
    var body: some View {
        VStack {
            List {
                Section(header: Text("List of name")) {
                    ForEach(vm.names, id: \.self) { Text($0) }
                }
                
                Section {
                    ForEach(vm.nameResult, id: \.name) { item in
                        HStack {
                            Text(item.name)
                            
                            Text(item.gender)
                            
                            Text(String(item.probability))
                        }
                    }
                }
            }
            
            Button("Get Data") { vm.fetch() }
        }
    }
}

struct FlatMapView_Previews: PreviewProvider {
    static var previews: some View {
        FlatMapView()
    }
}
