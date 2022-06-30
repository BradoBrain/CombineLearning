//
//  IgnoreOutputView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 30.06.2022.
//

import SwiftUI

struct IgnoreOutputView: View {
    @StateObject var vm = IgnoreOutputViewModel()
    
    var body: some View {
        VStack {
            List {
                Section(header: Text("Data")) {
                    ForEach(vm.dataForView, id: \.self) { item in
                        Text(item)
                    }
                }
                
                Section(header: Text("Ignored")) {
                    ForEach(vm.reportAboutIgnoring, id: \.self) { item in
                        Text(item)
                    }
                }
            }
        }
        .onAppear { vm.fetch() }
    }
}

struct IgnoreOutputView_Previews: PreviewProvider {
    static var previews: some View {
        IgnoreOutputView()
    }
}
