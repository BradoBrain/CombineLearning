//
//  ReplaceErrorView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 13.07.2022.
//

import SwiftUI

struct ReplaceErrorView: View {
    @StateObject var vm = ReplaceErrorViewModel()
    
    var body: some View {
        ZStack {
            List(vm.dataForView, id: \.self) { Text($0) }
            
            Button {
                vm.fetch()
            } label: {
                Spacer()
                
                VStack {
                    Spacer()
                    
                    Text("Fetch Data")
                        .padding()
                        .foregroundColor(.white)
                        .background(.blue)
                        . cornerRadius(50)
                        .frame(width: 100, height: 100)
                }
            }

        }
    }
}

struct ReplaceErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ReplaceErrorView()
    }
}
