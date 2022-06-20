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
            Section(header: Text("Appartment Selection"), footer: Text("The min coast is: \(vm.minCoast)").bold()) {
                ForEach(vm.appartment, id: \.id) { item in
                    HStack {
                        Text("\(item.appartmentTitle),")
                        
                        Text(item.city)
                        
                        Spacer()
                        
                        Text("\(item.coast)")
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
