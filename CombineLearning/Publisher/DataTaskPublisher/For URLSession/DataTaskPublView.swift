//
//  DataTaskPublView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 17.06.2022.
//

import SwiftUI

struct DataTaskPublView: View {
    @StateObject var vm = DataTaskPublViewModel()
    
    var body: some View {
            
            List(vm.dataForView, id: \._id) { data in
                Text(data.text)
            } .listStyle(.plain)
        .onAppear {
            vm.fetch()
        } .alert(item: $vm.errorForAlert) { error in
            Alert(title: Text(error.title), message: Text(error.message))
        }
    }
}

struct DataTaskPublView_Previews: PreviewProvider {
    static var previews: some View {
        DataTaskPublView()
    }
}
