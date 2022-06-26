//
//  MapView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 26.06.2022.
//

import SwiftUI

struct MapView: View {
    @StateObject var vm = MapViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            List(vm.dataForView1, id: \.self) { Text($0) }
            
            List(vm.dataForView2, id: \.self) { item in
                HStack{
                    Image(systemName: item)
                        .foregroundColor(.orange)
                    
                    Text(item)
                }
            }
        }
        .onAppear {
            vm.fetch()
            vm.fetch2()
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
