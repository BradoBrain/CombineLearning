//
//  DropUntilView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 21.06.2022.
//

import SwiftUI

struct DropUntilView: View {
    @StateObject var vm = DropUntilViewModel()
    
    var body: some View {
        VStack {
            List(vm.data, id: \.self) { item in
                Text(item)
            }
            Button("Start Pipeline") { vm.startPublishing.send(true) }
            
            Button("Stop Pipeline") { vm.cancellable.removeAll() } // It does not close the pipeline. It removes items from memory which will stop publishing data
        }
    }
}

struct DropUntilView_Previews: PreviewProvider {
    static var previews: some View {
        DropUntilView()
    }
}
