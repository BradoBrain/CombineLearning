//
//  SequenceView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 16.06.2022.
//

import SwiftUI

struct SequenceView: View {
    @StateObject var vm = SequenceViewModel()
    
    var body: some View {
        VStack {
            List(vm.dataForView, id: \.self) { value in
                Text(value)
            }
        }
        .onAppear {
            vm.fetch()
        }
    }
}

struct SequenceView_Previews: PreviewProvider {
    static var previews: some View {
        SequenceView()
    }
}
