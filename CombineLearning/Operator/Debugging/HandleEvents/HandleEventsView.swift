//
//  HandleEventsView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 13.07.2022.
//

import SwiftUI

struct HandleEventsView: View {
    @StateObject var vm = HandleEventsViewModel()
    
    var body: some View {
        VStack {
            List(vm.dataForView, id: \.self) { Text($0) }
        }
        .onAppear { vm.fetch() }
    }
}

struct HandleEventsView_Previews: PreviewProvider {
    static var previews: some View {
        HandleEventsView()
    }
}
