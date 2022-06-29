//
//  CollectByTimeView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 29.06.2022.
//

import SwiftUI

struct CollectByTimeView: View {
    @StateObject var vm = CollectByTimeViewModel()
    
    var body: some View {
        VStack {
            List(vm.collection, id: \.self) { item in
                Text(item.joined(separator: " "))
            }
            
            Slider(value: $vm.interval,
                   in: 0.1...2,
                   minimumValueLabel: Text("0"),
                   maximumValueLabel: Text("2"),
                   label: { Text("Interval") }).padding()
        }
        .onAppear { vm.fetch() }
    }
}

struct CollectByTimeView_Previews: PreviewProvider {
    static var previews: some View {
        CollectByTimeView()
    }
}
