//
//  TimerView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 17.06.2022.
//

import SwiftUI

struct TimerView: View {
    @StateObject var vm = TimerViewModel()
    
    var body: some View {
        VStack {
            Text("Set up your interval")
            
            Text(String(vm.interval))
            
            Slider(value: $vm.interval, in: 0...1,
                   minimumValueLabel: Text("Slow"),
                   maximumValueLabel: Text("Fast"),
                   label: { Text("Interval") })
            
            List(vm.data, id: \.self) { dataIn in
                Text(dataIn)
            } .font(.system(.title, design: .rounded))
            
            
            
            
        } .padding()
            .onAppear {
                vm.start()
            }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
