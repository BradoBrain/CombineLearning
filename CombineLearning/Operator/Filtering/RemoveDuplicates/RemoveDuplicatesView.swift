//
//  RemoveDuplicatesView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 26.06.2022.
//

import SwiftUI

struct RemoveDuplicatesView: View {
    @StateObject var vm = RemoveDuplicatesViewModel()
    
    var body: some View {
        VStack {
            List(vm.dataForView, id: \.self) { data in
                Text("\(data)")
            }
            
            Text("It does not remove dublicates when they don't go one after another")
                .foregroundColor(.red)
        }
        .onAppear {
            vm.fetch()
        }
    }
}

struct RemoveDuplicatesView_Previews: PreviewProvider {
    static var previews: some View {
        RemoveDuplicatesView()
    }
}
