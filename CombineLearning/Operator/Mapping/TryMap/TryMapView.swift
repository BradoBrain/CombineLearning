//
//  TryMapView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 26.06.2022.
//

import SwiftUI

struct TryMapView: View {
    @StateObject var vm = TryMapViewModel()
    
    var body: some View {
        VStack {
            List(vm.dataForView, id: \.self) { item in
                Text(item)
            }
        }
        .alert(item: $vm.tryMapError) { error in
            Alert(title: Text("Error"), message: Text(error.description), dismissButton: .cancel())
        }
        .onAppear {
            vm.fetch()
        }
    }
}

struct TryMapView_Previews: PreviewProvider {
    static var previews: some View {
        TryMapView()
    }
}
