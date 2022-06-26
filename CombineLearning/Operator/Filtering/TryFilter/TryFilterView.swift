//
//  TryFilterView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 26.06.2022.
//

import SwiftUI

struct TryFilterView: View {
    @StateObject var vm = TryFilterViewModel()
    
    var body: some View {
        VStack {
            List(vm.filteredForView, id: \.self) { item in
                Text(item)
            }
            
            HStack(spacing: 40) {
                Button("Name") { vm.filteredData(criteria: "name") }
                Button("City") { vm.filteredData(criteria: "city") }
                Button("Show All") { vm.filteredData(criteria: " ") }
            }
        }
        .alert(item: $vm.filterError) { error in
            Alert(title: Text("Error"), message: Text(error.errorDescription), dismissButton: .cancel())
        }
    }
}

struct TryFilterView_Previews: PreviewProvider {
    static var previews: some View {
        TryFilterView()
    }
}
