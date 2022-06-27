//
//  ScanView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 27.06.2022.
//

import SwiftUI

struct ScanView: View {
    @StateObject var vm = ScanViewModel()
    
    var body: some View {
        VStack {
            List(vm.dataForView, id: \.self) { item in
                Text(item)
            } .listStyle(.grouped)
                
                .onAppear() {
                    vm.fetch()
                }
        }
    }
}

struct ScanView_Previews: PreviewProvider {
    static var previews: some View {
        ScanView()
    }
}
