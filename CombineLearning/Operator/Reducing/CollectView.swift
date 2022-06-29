//
//  CollectView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 29.06.2022.
//

import SwiftUI

struct CollectView: View {
    @StateObject var vm = CollectViewModel()
    
    var body: some View {
        VStack {
            Toggle(isOn: $vm.circle, label: {
                Text("Toggle") .padding()
            })
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 50, maximum: 200))]) {
                ForEach(vm.dataForView, id: \.self) { item in
                    Image(systemName: item)
                }
            }
        }
        .onAppear {
            vm.fetch()
        }
    }
}

struct CollectView_Previews: PreviewProvider {
    static var previews: some View {
        CollectView()
    }
}
