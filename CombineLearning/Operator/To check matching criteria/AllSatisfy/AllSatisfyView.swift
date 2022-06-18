//
//  AllSatisfyView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 18.06.2022.
//

import SwiftUI

struct AllSatisfyView: View {
    @StateObject var vm = AllSatisfyViewModel()
    
    @State var number = ""
    @State var isResultShown = false
    
    var body: some View {
        VStack {
            Spacer(minLength: 250)
            
            HStack {
                TextField("Enter additional number", text: $number)
                    .textFieldStyle(.roundedBorder)
                
                Button(action: { vm.addNum(number: number) }, label: { Image(systemName: "plus")})
            } .padding()
            
            Text(vm.isFibonacciNum ? "All are Fibonacci" : "No")
                .opacity(isResultShown ? 1 : 0)
            
            List(vm.numbers, id: \.self) { num in
                Text("\(num)")
            }
            
            Spacer(minLength: 20)
            
            Button("Are these Fibonacci numbers?") {
                vm.isFibonacciCheck()
                isResultShown = true
            }
        }
    }
}

struct AllSaticfyView_Previews: PreviewProvider {
    static var previews: some View {
        AllSatisfyView()
    }
}
