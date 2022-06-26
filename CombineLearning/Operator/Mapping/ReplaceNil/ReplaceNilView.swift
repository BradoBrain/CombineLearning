//
//  ReplaceNilView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 26.06.2022.
//

import SwiftUI

struct ReplaceNilView: View {
    @StateObject var vm = ReplaceNilViewModel()
    
    var body: some View {
        List(vm.dataForView, id: \.self) { Text($0) }
    }
}

struct ReplaceNilView_Previews: PreviewProvider {
    static var previews: some View {
        ReplaceNilView()
    }
}
