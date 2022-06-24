//
//  TimeOutView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 24.06.2022.
//

import SwiftUI

struct TimeOutView: View {
    @StateObject var vm = TimeOutViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            
            if vm.isFetched {
                Text("Process ...")
            }
            
            Spacer()
            
            Button("Fetch Data") { vm.fetch() }
        }
        .alert(item: $vm.timeError) { error in
            Alert(title: Text(error.title), message: Text(error.message))
        }
    }
}

struct TimeOutView_Previews: PreviewProvider {
    static var previews: some View {
        TimeOutView()
    }
}
