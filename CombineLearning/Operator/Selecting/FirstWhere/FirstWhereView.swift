//
//  FirstWhereView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 01.07.2022.
//

import SwiftUI

struct FirstWhereView: View {
    @StateObject var vm = FirstWhereViewModel()
    
    var body: some View {
        VStack {
            List {
                Section {
                    TextField("Enter Your Search Criteria", text: $vm.criteria)
                    Text("First was found: \(vm.first)")
                }
                
                Section {
                    ForEach(vm.dataForView, id: \.self) { item in
                        Text(item)
                    }
                }
            }
        }
    }
}

struct FirstWhereView_Previews: PreviewProvider {
    static var previews: some View {
        FirstWhereView()
    }
}
