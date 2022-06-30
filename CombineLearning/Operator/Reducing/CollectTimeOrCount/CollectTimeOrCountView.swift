//
//  CollectTimeOrCountView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 30.06.2022.
//

import SwiftUI

struct CollectTimeOrCountView: View {
    @StateObject var vm = CollectTimeOrCountViewModel()
    
    var body: some View {
        VStack {
            List(vm.collection, id: \.self) { item in
                Text(item.joined(separator: " "))
            }
        }
        .onAppear() { vm.fetch() }
    }
}

struct CollectTimeOrCountView_Previews: PreviewProvider {
    static var previews: some View {
        CollectTimeOrCountView()
    }
}
