//
//  TryFirstWhereView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 02.07.2022.
//

import SwiftUI

struct TryFirstWhereView: View {
    @StateObject var vm = TryFirstWhereViewModel()
    
    var body: some View {
        VStack {
            List {
                Section {
                    TextField("Enter your search criteria", text: $vm.criteria)
                    
                    Text("First found item: \(vm.first)")
                }
                
                Section {
                    ForEach(vm.dataForView, id: \.self) { Text($0) }
                }
            }
        }
        .alert(item: $vm.error) {
            Alert(title: Text("Error"), message: Text($0.message), dismissButton: .cancel())
        }
    }
}

struct TryFirstWhereView_Previews: PreviewProvider {
    static var previews: some View {
        TryFirstWhereView()
    }
}
