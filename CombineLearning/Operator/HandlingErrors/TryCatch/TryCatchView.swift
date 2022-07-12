//
//  TryCatchView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 12.07.2022.
//

import SwiftUI

struct TryCatchView: View {
    @StateObject var vm = TryCatchViewModel()
    
    var body: some View {
        VStack {
            List(vm.dataForView, id: \.self) { Text($0) }
            
        }
        .alert(item: $vm.smileError) { error in
            Alert(title: Text("Error"), message: Text("Got another data"))
        }
        .onAppear { vm.fetch()}
    }
}

struct TryCatchView_Previews: PreviewProvider {
    static var previews: some View {
        TryCatchView()
    }
}
