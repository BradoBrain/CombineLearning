//
//  EmptyView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 14.06.2022.
//

import SwiftUI

struct EmptyView: View {
    @StateObject var vm = EmptyViewModel()
    
    var body: some View {
        VStack {
            List(vm.dataForView, id: \.self) { item in
                Text(item)
            }
        }
        .onAppear {
            vm.fetch()
        } // we use our func to get View with item until catching error
        // All data after error is not shown automatically
    }
}

struct EmptyView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
