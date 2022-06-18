//
//  DataTaskPubImageView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 18.06.2022.
//

import SwiftUI

struct DataTaskPubImageView: View {
    @StateObject var vm = DataTaskPubImageViewModel()
    
    var body: some View {
        VStack {
            vm.imageToView
        }
        .onAppear {
            vm.fetch()
        }
        .alert(item: $vm.errorForAlert) { error in
            Alert(title: Text(error.title), message: Text(error.message))
        }
        
    }
}

struct DataTaskPubImageView_Previews: PreviewProvider {
    static var previews: some View {
        DataTaskPubImageView()
    }
}
