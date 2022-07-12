//
//  MapErrorView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 12.07.2022.
//

import SwiftUI

struct MapErrorView: View {
    @StateObject var vm = MapErrorViewModel()
    
    var body: some View {
        VStack {
            List(vm.dataForView) { item in
                Label(title: {
                    Text(item.title)
                }, icon: {
                    Image(systemName: item.isComplited ? "checkmark.circle.fill" : "circle")
                })
            }
            
            Button("Fetch Data") {vm.fetch() }
        }
        .alert(item: $vm.error) { error in
            Alert(title: Text("Error"), message: Text(error.message))
        }
    }
}

struct MapErrorView_Previews: PreviewProvider {
    static var previews: some View {
        MapErrorView()
    }
}
