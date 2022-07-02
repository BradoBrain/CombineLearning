//
//  LastView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 02.07.2022.
//

import SwiftUI

struct LastView: View {
    @StateObject var vm = LastViewModel()
    
    var body: some View {
        VStack {
            List {
                Section(header: Text("Last value is:")) {
                    Text(vm.last)
                }
                
                Section(header: Text("List of value:")) {
                    ForEach(vm.dataForView, id: \.self) { Text($0) }
                }
            }
        }
        .onAppear {
            vm.fetch()
        }
    }
}

struct LastView_Previews: PreviewProvider {
    static var previews: some View {
        LastView()
    }
}
