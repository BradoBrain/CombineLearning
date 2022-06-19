//
//  ContainsWhereView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 19.06.2022.
//

import SwiftUI

struct ContainsWhereView: View {
    @StateObject var vm = ContainsWhereViewModel()
    
    var body: some View {
        VStack {
            Text("Name Of Fruit").bold()
            
            List {
                Section(header: Text("Fruit")) {
                    Text(vm.fruitName)
                }
                
                Section(header: Text("Nutritional Information")) {
                    HStack {
                        Text("Vitamin A")
                        
                        Spacer()
                        
                        Image(systemName: vm.vitaminA ? "checkmark.circle.fill" : "x.circle.fill")
                            .foregroundColor(vm.vitaminA ? .green : .red)
                    }
                    HStack {
                        Text("Vitamin B")
                        
                        Spacer()
                        
                        Image(systemName: vm.vitaminB ? "checkmark.circle.fill" : "x.circle.fill")
                            .foregroundColor(vm.vitaminB ? .green : .red)
                    }
                    HStack {
                        Text("Vitamin C")
                        
                        Spacer()
                        
                        Image(systemName: vm.vitaminC ? "checkmark.circle.fill" : "x.circle.fill")
                            .foregroundColor(vm.vitaminC ? .green : .red)
                    }
                }
            }
        }
        .onAppear {
            vm.fetch()
        }
    }
}

struct ContainsWhereView_Previews: PreviewProvider {
    static var previews: some View {
        ContainsWhereView()
    }
}
