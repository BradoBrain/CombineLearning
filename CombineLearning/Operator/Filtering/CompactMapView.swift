//
//  CompactMapView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 24.06.2022.
//

import SwiftUI

struct CompactMapView: View {
    @StateObject var vm = CompactMapViewModel()
    
    var body: some View {
        VStack {
            Text("Without .compactMap")
            
            List(vm.dataWithNil, id: \.self) { item in
                Text(item)
            }
            
            Text("With .compactMap")
            
            List(vm.dataWithoutNil, id: \.self) { item in
                Text(item)
            }
            
        }
        .listStyle(.grouped)
        .onAppear {
            vm.fetch()
        }
    }
}

struct CompactMapView_Previews: PreviewProvider {
    static var previews: some View {
        CompactMapView()
    }
}
