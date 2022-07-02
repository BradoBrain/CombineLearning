//
//  OutputInView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 02.07.2022.
//

import SwiftUI

struct OutputInView: View {
    @StateObject var vm = OutputInViewModel()
    
    var body: some View {
        VStack {
            List {
                Section {
                    Stepper("Set start index. Now: \(vm.startIndex)", value: $vm.startIndex, step: 1)
                    
                    Stepper("Set end index. Now: \(vm.endIndex)", value: $vm.endIndex, step: 1)
                }
                
                Section(header: Text("Data from index selection")) {
                    ForEach(vm.dataForView, id: \.self) { item in
                        HStack {
                            Text("\(item.index): \(item.value)")
                        }
                    }
                }
            }
        }
    }
}

struct OutputInView_Previews: PreviewProvider {
    static var previews: some View {
        OutputInView()
    }
}
