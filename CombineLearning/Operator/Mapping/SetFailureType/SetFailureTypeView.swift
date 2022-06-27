//
//  SetFailureTypeView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 27.06.2022.
//

import SwiftUI

struct SetFailureTypeView: View {
    @StateObject var vm = SetFailureTypeViewModel()
    
    var body: some View {
        VStack {
            List(vm.dataForView, id: \.self) { item in
                Text(item)
            }
            
            HStack(spacing: 100) {
                Button("WEST") { vm.fetch(west: true) }
                
                Button("EAST") { vm.fetch(west: false)}
            }
        }
        .alert(item: $vm.setFailureError) { error in
            Alert(title: Text("Error"), message: Text(error.description), dismissButton: .cancel())
        }
        
    }
}

struct SetFailureTypeView_Previews: PreviewProvider {
    static var previews: some View {
        SetFailureTypeView()
    }
}
