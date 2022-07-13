//
//  RetryView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 13.07.2022.
//

import SwiftUI

struct RetryView: View {
    @StateObject var vm = RetryViewModel()
    
    var body: some View {
        VStack {
            Text(vm.linkData)
                .padding()
        }
        .onAppear { vm.fetch() }
    }
}

struct RetryView_Previews: PreviewProvider {
    static var previews: some View {
        RetryView()
    }
}
