//
//  PrintView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 13.07.2022.
//

import SwiftUI

struct PrintView: View {
    @StateObject var vm = PrintViewModel()
    
    var body: some View {
        VStack {
            List(vm.dataForView, id: \.self) { Text($0) }
        }
        .onAppear { vm.fetch() }
    }
}

struct PrintView_Previews: PreviewProvider {
    static var previews: some View {
        PrintView()
    }
}
