//
//  TryCompactMapView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 26.06.2022.
//

import SwiftUI

struct TryCompactMapView: View {
    @StateObject var vm = TryCompactMapViewModel()
    
    var body: some View {
        VStack {
            List(vm.dataForView, id: \.self) { item in
                Text(item)
            }
            
        }
        .alert(item: $vm.tryCompactError) { error in
            Alert(title: Text("Error"), message: Text(error.message), dismissButton: .cancel())
        }
        .onAppear {
            vm.fetch()
        }
    }
}

struct TryCompactMapView_Previews: PreviewProvider {
    static var previews: some View {
        TryCompactMapView()
    }
}
