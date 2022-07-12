//
//  CatchView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 12.07.2022.
//

import SwiftUI

struct CatchView: View {
    @StateObject var vm = CatchViewModel()
    
    var body: some View {
        VStack {
            List(vm.dataForView, id: \.self) { Text($0) }
        }
        .onAppear { vm.fetch() }
    }
}

struct CatchView_Previews: PreviewProvider {
    static var previews: some View {
        CatchView()
    }
}
