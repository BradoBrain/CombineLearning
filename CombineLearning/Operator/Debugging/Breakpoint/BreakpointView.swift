//
//  BreakpointView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 13.07.2022.
//

import SwiftUI

struct BreakpointView: View {
    @StateObject var vm = BreakpointViewModel()
    
    var body: some View {
        VStack {
            List(vm.dataForView, id: \.self) { Text($0) }
        }
        .onAppear { vm.fetch() }
    }
}

struct BreakpointView_Previews: PreviewProvider {
    static var previews: some View {
        BreakpointView()
    }
}
