//
//  CountView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 19.06.2022.
//

import SwiftUI

struct CountView: View {
    @StateObject var vm = CountViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                NavigationLink(destination: DetailCountView(data: vm.partsArray), label: {
                    Text(vm.framework)
                    Text("\(vm.count)")
                })
            } .navigationBarTitle(".count operator")
        }
        .onAppear { vm.fetch() }
    }
}

struct CountView_Previews: PreviewProvider {
    static var previews: some View {
        CountView()
    }
}

struct DetailCountView: View {
    var data: [String]
    
    var body: some View {
        List(data, id: \.self) { data in
            Text(data)
        }
    }
}
