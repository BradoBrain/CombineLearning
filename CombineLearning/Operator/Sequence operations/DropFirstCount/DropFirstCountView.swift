//
//  DropFirstCountView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 22.06.2022.
//

import SwiftUI

struct DropFirstCountView: View {
    @StateObject var vm = DropFirstCountViewModel()
    
    var body: some View {
        VStack {
            List(vm.dataForView, id: \.self) { item in
                Text(item)
            }
        }
        .onAppear() {
            vm.fetch()
        }
    }
}

struct DropFirstCountView_Previews: PreviewProvider {
    static var previews: some View {
        DropFirstCountView()
    }
}
