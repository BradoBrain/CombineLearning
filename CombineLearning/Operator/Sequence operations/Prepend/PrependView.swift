//
//  PrependView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 22.06.2022.
//

import SwiftUI

struct PrependView: View {
    @StateObject var vm = PrependViewModel()
    
    var body: some View {
        VStack {
            List(vm.dataForView, id: \.self) { item in
                Text(item)
            }
        }
        .onAppear {
            vm.fetch()
        }
    }
}

struct PrependView_Previews: PreviewProvider {
    static var previews: some View {
        PrependView()
    }
}
