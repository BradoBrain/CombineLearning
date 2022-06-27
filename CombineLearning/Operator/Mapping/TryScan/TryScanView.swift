//
//  TryScanView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 27.06.2022.
//

import SwiftUI

struct TryScanView: View {
    @StateObject var vm = TryScanViewModel()
    
    var body: some View {
        VStack {
            List(vm.dataForView, id: \.self) { item in
                Text(item)
            }
        }
        .onAppear { vm.fetch() }
    }
}

struct TryScanView_Previews: PreviewProvider {
    static var previews: some View {
        TryScanView()
    }
}
