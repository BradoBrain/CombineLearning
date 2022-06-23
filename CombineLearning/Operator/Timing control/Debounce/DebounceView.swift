//
//  DebounceView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 23.06.2022.
//

import SwiftUI

struct DebounceView: View {
    @StateObject var vm = DebounceViewModel()
    
    var body: some View {
        VStack(spacing: 25) {
            Spacer()
            
            Text(vm.wordEntered) // It will be shown in 1 sec after we will stop tiping
            
            TextField("Enter a word", text: $vm.word)
                .textFieldStyle(.roundedBorder)
            
            Spacer()
        } .padding()
    }
}

struct DebounceView_Previews: PreviewProvider {
    static var previews: some View {
        DebounceView()
    }
}
