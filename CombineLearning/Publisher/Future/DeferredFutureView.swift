//
//  DeferredFutureView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 15.06.2022.
//

import SwiftUI

struct DeferredFutureView: View {
    @StateObject var vm = DeferredFutureViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            Text(vm.firstRun)
            
            Text("Repeat: \(vm.secondRun)")
            
            Button("Repeat running") {
                vm.fetchAgain()
            }
        }
        .onAppear() {
            vm.fetch()
        }
    }
}

struct DeferredFutureView_Previews: PreviewProvider {
    static var previews: some View {
        DeferredFutureView()
    }
}
