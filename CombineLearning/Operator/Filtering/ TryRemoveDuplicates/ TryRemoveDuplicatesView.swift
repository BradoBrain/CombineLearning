//
//   TryRemoveDuplicatesView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 26.06.2022.
//

import SwiftUI

struct _TryRemoveDuplicatesView: View {
    @StateObject var vm = TryRemoveDuplicatesViewModel()
    
    var body: some View {
        List(vm.dataForView, id: \.self) { item in
            HStack {
                Text(item.name)
                
                Spacer()
                
                Text(item.email)
            }
        }
        .alert(item: $vm.removeDuplicatesError) { error in
            Alert(title: Text("Error"), message: Text(error.description), dismissButton: .cancel())
        }
        .onAppear() {
            vm.fetch()
        }
    }
}

struct _TryRemoveDuplicatesView_Previews: PreviewProvider {
    static var previews: some View {
        _TryRemoveDuplicatesView()
    }
}
