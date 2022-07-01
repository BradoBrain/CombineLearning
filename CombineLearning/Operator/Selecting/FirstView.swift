//
//  FirstView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 01.07.2022.
//

import SwiftUI

struct FirstView: View {
    @StateObject var vm = FirstViewModel()
    
    var body: some View {
        VStack {
            List {
                Section(header: Text("List Of Cities"), footer: Text("The first city in list: \(vm.firstItem)")) {
                    ForEach(vm.dataForView, id: \.self) { i in
                        Text(i)
                    }
                }
            }
        }
        .onAppear {
            vm.fetch()
        }
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
