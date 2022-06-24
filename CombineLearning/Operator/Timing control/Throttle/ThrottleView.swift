//
//  ThrottleView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 24.06.2022.
//

import SwiftUI

struct ThrottleView: View {
    @StateObject var vm = ThrottleViewModel()
    
    var body: some View {
        VStack {
            Text("\(vm.throttleValue.formatted())")
            Slider(value: $vm.throttleValue, in: 0...1).padding()
            
            List(vm.data, id: \.self) { item in
                Text(item)
            }
            
            HStack(spacing: 80) {
                Button("Start") { vm.start() }
                
                Button("Reset") { vm.reset() }
            }
        }
    }
}

struct ThrottleView_Previews: PreviewProvider {
    static var previews: some View {
        ThrottleView()
    }
}
