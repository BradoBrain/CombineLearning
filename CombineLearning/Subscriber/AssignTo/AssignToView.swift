//
//  AssignToView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 04.07.2022.
//

import SwiftUI

struct AssignToView: View {
    @StateObject var vm = AssignToViewModel()
    
    var body: some View {
        Text(vm.greeting)
            .onAppear {
                vm.fetch()
            }
    }
}

struct AssignToView_Previews: PreviewProvider {
    static var previews: some View {
        AssignToView()
    }
}
