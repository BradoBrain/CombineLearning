//
//  DelayView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 13.06.2022.
//

import SwiftUI

struct DelayView: View {
    @StateObject var vm = DelayViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            Text("Data: \(vm.data)")
            
            Text(vm.status)
            
            Button(action: { vm.refresh() }, label: {
                HStack {
                    Image(systemName: "arrow.triangle.2.circlepath")
                    Text("Refresh Data")
                }
            })
            
            Spacer()
            
            Button("Cancel") { vm.cancel() }
                .opacity(vm.status == "In process..." ? 1 : 0)
            
            
        }
    }
}

struct DelayView_Previews: PreviewProvider {
    static var previews: some View {
        DelayView()
    }
}
