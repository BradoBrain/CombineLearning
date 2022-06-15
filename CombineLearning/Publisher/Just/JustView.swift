//
//  JustView.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 15.06.2022.
//

import SwiftUI

struct JustView: View {
    @StateObject var vm = JustViewModel()
    var body: some View {
        VStack {
            Text("""
"The winner on this week:
\(vm.winner)
""")
            .bold()
            .multilineTextAlignment(.center)
            
            Form {
                Section("List Of Players") {
                    List(vm.listOfPlayers, id: \.self) { item in
                        Text(item)
                    }
                }
            }
        }
        .onAppear {
            vm.fetch()
        }
    }
}

struct JustView_Previews: PreviewProvider {
    static var previews: some View {
        JustView()
    }
}
