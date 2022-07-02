//
//  OutputAtView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 02.07.2022.
//

import SwiftUI

struct OutputAtView: View {
    @StateObject var vm = OutputAtViewModel()
    
    var body: some View {
        VStack {
            List {
                Section(footer: Text("Selected index go to value: \(vm.selectedIndex)")) {
                    Stepper("Choose an index. Now:   \(vm.index)", value: $vm.index, step: 1)
                }
                
                Section(header: Text("List of names")) {
                    ForEach(vm.dataForView, id: \.self) { Text($0) }
                }
            }
        }
    }
}

struct OutputAtView_Previews: PreviewProvider {
    static var previews: some View {
        OutputAtView()
    }
}
