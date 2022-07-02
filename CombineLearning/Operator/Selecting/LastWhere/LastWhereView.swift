//
//  LastWhereView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 02.07.2022.
//

import SwiftUI

struct LastWhereView: View {
    @StateObject var vm = LastWhereViewModel()
    
    var body: some View {
        VStack {
            List {
                Section(header: Text("List of aliens"), footer: Text("The Last Man From Earth: \(vm.lastManFromEarth)")) {
                    ForEach(vm.dataForView, id: \.self) { item in
                        HStack {
                            Text(item.name)
                            
                            Text("is " + item.gender + " from " + item.planet)
                        }
                    }
                }
            }
        }
        .onAppear {
            vm.fetch()
        }
    }
}

struct LastWhereView_Previews: PreviewProvider {
    static var previews: some View {
        LastWhereView()
    }
}
