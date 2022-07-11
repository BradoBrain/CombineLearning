//
//  SwitchToLatestView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 11.07.2022.
//

import SwiftUI

struct SwitchToLatestView: View {
    @StateObject var vm = SwitchToLatestViewMOdel()
    
    var body: some View {
        VStack {
            List {
                Section(header: Text("List of names")) {
                    ForEach(vm.names, id: \.self) { Text($0) }
                }
                
                Section(header: Text("Latest publisher")) {
                    ForEach(vm.familyResult, id: \.name) { result in
                        HStack {
                            Text(result.name)
                            
                            Text(result.gender)
                            
                            Text("\(result.probability)")
                        }
                    }
                }
            }
            
            Button("Get Data") { vm.fetch() }
        }
    }
}

struct SwitchToLatestView_Previews: PreviewProvider {
    static var previews: some View {
        SwitchToLatestView()
    }
}
