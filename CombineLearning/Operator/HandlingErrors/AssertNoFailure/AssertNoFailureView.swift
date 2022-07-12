//
//  AssertNoFailureView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 12.07.2022.
//

import SwiftUI

struct AssertNoFailureView: View {
    @StateObject var vm = AssertNoFailureViewModel()
    
    var body: some View {
        VStack {
            List(vm.dataForView, id: \.self) { Text($0) }
        }
        .onAppear {
            vm.fetch()
        }
    }
}

struct AssertNoFailureView_Previews: PreviewProvider {
    static var previews: some View {
        AssertNoFailureView()
    }
}
