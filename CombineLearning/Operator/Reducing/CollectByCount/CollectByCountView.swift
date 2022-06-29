//
//  CollectByCountView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 29.06.2022.
//

import SwiftUI

struct CollectByCountView: View {
    @StateObject var vm = CollectByCountViewModel()
    
    var body: some View {
        VStack {
            Text("Groups")
            
            List(vm.groups, id: \.self) { item in
                Text(item.joined(separator: "; "))
            }
            
            Slider(value: $vm.valuesGroupsSize,
                   in: 1...4, step: 1,
                   minimumValueLabel: Text("1"),
                   maximumValueLabel: Text("4"),
                   label: { }) .padding()
        }
        .onAppear() {
            vm.fetch()
        }
    }
}

struct CollectByCountView_Previews: PreviewProvider {
    static var previews: some View {
        CollectByCountView()
    }
}
