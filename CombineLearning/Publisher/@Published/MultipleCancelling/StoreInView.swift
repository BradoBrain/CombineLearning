//
//  StoreInView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 13.06.2022.
//

import SwiftUI

struct StoreInView: View {
    @StateObject var vm = StoreInViewModel()
    @State var isTapped = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Spacer()
            
            TextField("Enter a login", text: $vm.login)
                .textFieldStyle(.roundedBorder)
            
            Text(vm.loginValidation)
                .font(.callout)
                .foregroundColor(vm.logValidColor)
            
            SecureField("Enter a password", text: $vm.password)
                .textFieldStyle(.roundedBorder)
            
            Text(vm.passwordValidation)
                .font(.callout)
                .foregroundColor(vm.passwValidColor)
            
            Spacer()
            
            Button("Cancel All") {
                vm.cancelAllValidation()
                self.isTapped = true
            } // Removing an AnyCancellable reference. Validation data not change after tap.
            
        } .padding()
    }
}

struct StoreInView_Previews: PreviewProvider {
    static var previews: some View {
        StoreInView()
    }
}
