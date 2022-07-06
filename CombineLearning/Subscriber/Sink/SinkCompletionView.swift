//
//  SinkCompletionView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 06.07.2022.
//

import SwiftUI

struct SinkCompletionView: View {
    @StateObject var vm = SinkCompletionViewModel()
    
    var body: some View {
        ZStack {
            
            VStack {
                Text(vm.data)
                
                Button("Get Data") { vm.fetch() }
            }
            
            if vm.isProcessing { ProcessingView() }
        }
    }
}

struct SinkCompletionView_Previews: PreviewProvider {
    static var previews: some View {
        SinkCompletionView()
    }
}

struct ProcessingView: View {  
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 200, height: 200)
                .foregroundStyle(.ultraThinMaterial)
            
            VStack {
                
                Text("Process ...")
                    .padding()
                    .foregroundColor(.blue)
                
                ProgressView()
                    .progressViewStyle(.circular)
                    .tint(.blue)
                    .padding()
            }
        }
    }
}
