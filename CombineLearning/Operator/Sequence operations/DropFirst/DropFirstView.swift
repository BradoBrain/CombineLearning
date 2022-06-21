//
//  DropFirstView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 21.06.2022.
//

import SwiftUI

struct DropFirstView: View {
    @StateObject var vm = DropFirstViewModel()
    
    var idStatusText: String {
        switch vm.userIDValid {
        case .ok:
            return "OK"
        case .invalid:
            return "Invalide"
        case .notEvaluated:
            return "Not Evaluated"
        }
    }
    
    var idStatusColor: Color {
        switch vm.userIDValid {
        case .ok:
            return .green
        case .invalid:
            return .red
        default:
            return .secondary
        }
    }
    
    
    var body: some View {
        VStack(spacing: 25) {
            Text("Let's Create Your User ID").bold().font(.title)
            
            Spacer()
            
            Text("ID Status: \(idStatusText)")
            
            TextField("Text here", text: $vm.userID)
                .padding()
                .border(idStatusColor)
            
            Spacer()
            Spacer()
        } .padding()
    }
}

struct DropFirstView_Previews: PreviewProvider {
    static var previews: some View {
        DropFirstView()
    }
}
