//
//  DelayForView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 23.06.2022.
//

import SwiftUI

struct DelayForView: View {
    @StateObject var vm = DelayForViewModel()
    
    var body: some View {
        VStack {
            Spacer(minLength: 300)
            Text("Set Delay for:").bold().font(.title)
            
            Picker(selection: $vm.delay, label: Text("Delay Time")) {
                Text("0").tag(0)
                Text("1").tag(1)
                Text("2").tag(2)
                Text("3").tag(3)
                Text("4").tag(4)
            } .pickerStyle(.segmented) .padding()
            
            Button("Fetch Data") { vm.fetch() }
            
            if vm.isFetched {
                ProgressView()
            } else {
                Text(vm.data)
            }
            
            Spacer(minLength: 300)
        }
    }
}

struct DelayForView_Previews: PreviewProvider {
    static var previews: some View {
        DelayForView()
    }
}

struct ProgressView: View {
    @State var isProgress1 = false
    @State var isProgress2 = false
    @State var isProgress3 = false
    
    var body: some View {
        VStack {
            HStack {
                Circle()
                    .frame(width: 10)
                    .foregroundColor(.mint)
                    .opacity(isProgress1 ? 1 : 0)
                    .animation(.default.delay(0.3).repeatForever(), value: isProgress1)
                
                Circle()
                    .frame(width: 10)
                    .foregroundColor(.orange)
                    .opacity(isProgress2 ? 1 : 0)
                    .animation(.default.delay(0.31).repeatForever(), value: isProgress2)
                
                Circle()
                    .frame(width: 10)
                    .foregroundColor(.purple)
                    .opacity(isProgress3 ? 1 : 0)
                    .animation(.default.delay(0.32).repeatForever(), value: isProgress3)
            }
        }
        .onAppear {
            withAnimation(.default.delay(0.1).repeatForever(autoreverses: false)) {
                isProgress1.toggle()
                isProgress2.toggle()
                isProgress3.toggle()
            }
        }
    }
}
