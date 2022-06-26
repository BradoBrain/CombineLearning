//
//  FilterView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 26.06.2022.
//

import SwiftUI

struct FilterView: View {
    @StateObject var vm = FilterViewModel()
    
    var body: some View {
        VStack {
            List(vm.dataAfterFilter, id: \.self) { data in
                Text(data)
            }
            HStack(spacing: 40) {
                Button("Name") { vm.filterData(criteria: "name") }
                Button("City") { vm.filterData(criteria: "city") }
                Button("Show all") { vm.filterData(criteria: " ") }
            }
        }
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
    }
}
