//
//  ReduceView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 30.06.2022.
//

import SwiftUI

struct ReduceView: View {
    @StateObject var vm = ReduceViewModel()
    
    var body: some View {
        VStack {
            List {
                Section(header: Text("Reduce operator view"), footer: Text("The biggest number is \(vm.biggestValue)")) {
                    ForEach(vm.dataForView, id: \.self) { num in
                        Text(String(num))
                    }
                }
            }
            .onAppear { vm.fetch() }
            
        }
    }
}

struct ReduceView_Previews: PreviewProvider {
    static var previews: some View {
        ReduceView()
    }
}
