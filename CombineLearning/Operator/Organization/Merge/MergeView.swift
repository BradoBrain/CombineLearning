//
//  MergeView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 11.07.2022.
//

import SwiftUI

struct MergeView: View {
    @StateObject var vm = MergeViewModel()
    
    var body: some View {
        VStack {
            List {
                Section(header: Text("Merged pipelines")) {
                    ForEach(vm.dataForView, id: \.self) {
                        Text($0)
                    }
                }
            }
        }
        .onAppear { vm.fetch() }
    }
}

struct MergeView_Previews: PreviewProvider {
    static var previews: some View {
        MergeView()
    }
}
