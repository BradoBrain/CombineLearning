//
//  TryMaxByView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 20.06.2022.
//

import SwiftUI

struct TryMaxByView: View {
    @StateObject var vm = TryMaxByViewModel()
    
    var body: some View {
        List {
            Section(header: Text("Appartment Selection").bold()) {
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
        .alert(item: $vm.invalidCity) { alertData in
            Alert(title: Text("City is invalid"), message: Text(alertData.city))
        }
        
        .onAppear() {
            vm.fetch()
        }
    }
}

struct TryMaxByView_Previews: PreviewProvider {
    static var previews: some View {
        TryMaxByView()
    }
}
