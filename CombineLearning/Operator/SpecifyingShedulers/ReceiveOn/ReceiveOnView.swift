//
//  ReceiveOnView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 03.07.2022.
//

import SwiftUI

struct ReceiveOnView: View {
    @StateObject var vm = ReceiveOnViewModel()
    
    var body: some View {
        VStack {
            Button("Get Data") { vm.fetch() }
            
            vm.errorImage
                .resizable()
                .scaledToFit()
            
            Spacer()
        }
    }
}

struct ReceiveOnView_Previews: PreviewProvider {
    static var previews: some View {
        ReceiveOnView()
    }
}
