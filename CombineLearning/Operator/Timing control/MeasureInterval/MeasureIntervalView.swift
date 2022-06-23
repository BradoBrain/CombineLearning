//
//  MeasureIntervalView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 23.06.2022.
//

import SwiftUI

struct MeasureIntervalView: View {
    @StateObject var vm = MeasureIntervalViewModel()
    
    @State var start = false
    
    var body: some View {
        VStack {
            Text("Tap on the circle to change color").bold().opacity(0.8)
            
            Circle()
                .frame(width: 200, height: 200)
                .foregroundColor(start ? .purple : .secondary)
                .animation(.easeInOut, value: start)
                .onTapGesture {
                    DispatchQueue.main.asyncAfter(deadline: .now() + Double.random(in: 0.1...2.0)) {
                        self.start.toggle()
                        vm.timeEvent.send()
                    }
                }
            
            Text("Changing interval: \(vm.interval)")
        }
    }
}

struct MeasureIntervalView_Previews: PreviewProvider {
    static var previews: some View {
        MeasureIntervalView()
    }
}
