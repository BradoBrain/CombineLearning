//
//  SubscribeOnView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 03.07.2022.
//

import SwiftUI

struct SubscribeOnView: View {
    @StateObject var vm = SubscribeOnViewModel()
    
    var body: some View {
        VStack {
            List(vm.dataForView, id: \.self) { Text($0) }
            
            Button("Fetch Data") { vm.fetch() }
        }
    }
}

struct SubscribeOnView_Previews: PreviewProvider {
    static var previews: some View {
        SubscribeOnView()
    }
}
