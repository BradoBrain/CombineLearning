//
//  MaxByView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 20.06.2022.
//

import SwiftUI

struct MaxByView: View {
    @StateObject var vm = MaxByViewModel()
    
    var body: some View {
        List {
            Section(header: Text("Appartment Selection"), footer: Text("Min cost: \(vm.minCost). Max cost: \(vm.maxCost)").bold()) {
                ForEach(vm.appartment, id: \.id) { item in
                    HStack {
                        Text("\(item.appartmentTitle),")
                        
                        Text(item.city)
                        
                        Spacer()
                        
                        Text("\(item.cost)")
                    }
                }
            }
        }
        .onAppear() {
            vm.fetch()
        }
    }
}

struct MaxByView_Previews: PreviewProvider {
    static var previews: some View {
        MaxByView()
    }
}
