//
//  BreakpointOnErrorView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 13.07.2022.
//

import SwiftUI

struct BreakpointOnErrorView: View {
    @StateObject var vm = BreakpointOnErrorViewModel()
    
    var body: some View {
        VStack {
            List(vm.dataForView, id: \.self) { Text($0) }
        }
        .onAppear { vm.fetch() }
    }
}

struct BreakpointOnErrorView_Previews: PreviewProvider {
    static var previews: some View {
        BreakpointOnErrorView()
    }
}
