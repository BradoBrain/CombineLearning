//
//  AppendView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 21.06.2022.
//

import SwiftUI

struct AppendView: View {
    @StateObject var vm = AppendViewModel()
    
    var body: some View {
        VStack {
            Text("What cities should you visite?")
            
            Button("Show the results") { vm.fetch() }
            
            List(vm.dataForView, id: \.self) { item in
                Text(item)
            }
        }
    }
}

struct AppendView_Previews: PreviewProvider {
    static var previews: some View {
        AppendView()
    }
}
