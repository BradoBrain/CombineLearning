//
//  TryAllSatisfyView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 18.06.2022.
//

import SwiftUI

struct TryAllSatisfyView: View {
    @StateObject var vm = TryAllSatisfyViewModel()
    
    @State var number = ""
    @State var isResultShown = false
    
    var body: some View {
        VStack {
            Spacer(minLength: 250)
            
            HStack {
                TextField("Enter number less than 144", text: $number)
                    .textFieldStyle(.roundedBorder)
                
                Button(action: {
                    vm.add(number: number)
                    number = ""
                }, label: { Image(systemName: "plus")})
            } .padding()
            
            Text(vm.isFibonacciNum ? "All are Fibonacci" : "No")
                .opacity(isResultShown ? 1 : 0)
            
            List(vm.numbers, id: \.self) { num in
                Text("\(num)")
            }
            
            Spacer(minLength: 20)
            
            Button("Are these Fibonacci numbers?") {
                vm.allOfNumFibanacciCheck()
                isResultShown = true
            }
            .alert(item: $vm.invalidNumError) { error in
                Alert(title: Text("Number is more than 144"),
                      primaryButton: .default(Text("Start Over"), action: { vm.numbers.removeAll() }),
                      secondaryButton: .cancel())
                
            }
        }
    }
}

struct TryAllSatisfyView_Previews: PreviewProvider {
    static var previews: some View {
        TryAllSatisfyView()
    }
}
