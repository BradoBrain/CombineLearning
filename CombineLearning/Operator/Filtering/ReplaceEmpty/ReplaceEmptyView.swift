//
//  ReplaceEmptyView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 26.06.2022.
//

import SwiftUI

struct ReplaceEmptyView: View {
    @StateObject var vm = ReplaceEmptyViewModel()
    
    var body: some View {
        VStack {
            Spacer(minLength: 200)
            
            HStack {
                TextField("Enter criteria", text: $vm.criteria)
                    .textFieldStyle(.roundedBorder)
                
                Button("Search") { vm.search() }.buttonStyle(.borderedProminent)
            } .padding()
            
            List(vm.dataForView, id: \.self) { item in
                Text(item)
                    .foregroundColor(item == vm.noResults ? .red : .green)
            }
            
            Button("Clear List") { vm.clear() }
        }
    }
}

struct ReplaceEmptyView_Previews: PreviewProvider {
    static var previews: some View {
        ReplaceEmptyView()
    }
}
