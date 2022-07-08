//
//  CombineLatestView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 08.07.2022.
//

import SwiftUI

struct CombineLatestView: View {
    @StateObject var vm = CombineLatestViewModel()
    
    var body: some View {
        VStack {
            Image(systemName: vm.shapeData.image)
                .font(.largeTitle)
                .foregroundColor(.white.opacity(0.8))
            
            Text("Name of symbol: \(vm.shapeData.image)")
                .foregroundColor(.white.opacity(0.7))
        }
        .padding()
        .background(.ultraThinMaterial)
        .background(vm.shapeData.color)
        .cornerRadius(20)
        .onAppear { vm.fetch() }
    }
}

struct CombineLatestView_Previews: PreviewProvider {
    static var previews: some View {
        CombineLatestView()
    }
}
