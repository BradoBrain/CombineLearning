//
//  PrefixView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 22.06.2022.
//

import SwiftUI

struct PrefixView: View {
    @StateObject var vm = PrefixViewModel()
    
    
    var body: some View {
        VStack {
            List(vm.data, id: \.self) { item in
                Text(item)
            }
            
            Button("Fetch Data") { vm.fetch() }
            
            Slider(value: $vm.count, in: 1...10, step: 1).padding()
            
            Text("\(vm.count.formatted(.number))")
        }
    }
}

struct PrefixView_Previews: PreviewProvider {
    static var previews: some View {
        PrefixView()
    }
}
