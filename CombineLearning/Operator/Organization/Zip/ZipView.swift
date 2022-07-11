//
//  ZipView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 11.07.2022.
//

import SwiftUI

struct ZipView: View {
    @StateObject var vm = ZipViewModel()
    
    var body: some View {
        VStack {
            LazyHGrid(rows: [GridItem(.adaptive(minimum: 100, maximum: 100))]) {
                ForEach(vm.dataForView, id: \.image) { shapeData in
                    VStack {
                        Text(shapeData.image)
                            .foregroundColor(.white.opacity(0.7))
                        
                        Image(systemName: shapeData.image)
                            .font(.largeTitle)
                            .foregroundColor(.white.opacity(0.9))
                        
                    }
                    .padding()
                    .frame(width: 200, height: 100)
                    .background(.ultraThinMaterial)
                    .background(shapeData.color)
                    .cornerRadius(20)
                    
                }
            }
        }
        .onAppear { vm.fetch() }
    }
}

struct ZipView_Previews: PreviewProvider {
    static var previews: some View {
        ZipView()
    }
}
