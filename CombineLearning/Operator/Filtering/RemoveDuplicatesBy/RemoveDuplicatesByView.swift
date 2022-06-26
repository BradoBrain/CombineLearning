//
//  RemoveDuplicatesByView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 26.06.2022.
//

import SwiftUI

struct RemoveDuplicatesByView: View {
    @StateObject var vm = RemoveDuplicatesByViewModel()
    
    var body: some View {
            List(vm.dataForView, id: \.self) { item in
                HStack {
                    Text(item.name)
                    
                    Spacer()
                    
                    Text(item.email)
                }
        }
        .onAppear() {
            vm.fetch()
        }
    }
}

struct RemoveDuplicatesByView_Previews: PreviewProvider {
    static var previews: some View {
        RemoveDuplicatesByView()
    }
}
