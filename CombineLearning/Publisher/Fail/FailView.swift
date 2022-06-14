//
//  FailView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 14.06.2022.
//

import SwiftUI

struct FailView: View {
    @StateObject var vm = FailViewModel()
    @State var number = ""
    @State var alert = false
    
    var body: some View {
        VStack (spacing: 20) {
            Text("Enter a number from 0 to 10")
            
            TextField("Enter your number here", text: $number)
                .textFieldStyle(.roundedBorder)
            
            Text("Your number is \(vm.num)")
            
            Button("Save") {
                vm.save(num: Int(number) ?? -1)
            }            
            
        } .padding()
    }
}

struct FailView_Previews: PreviewProvider {
    static var previews: some View {
        FailView()
    }
}
