//
//  AnyPublisherExample.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 08.07.2022.
//

import SwiftUI
import Combine

class AnyPublisherExampleViewModel: ObservableObject {
    @Published var watchFamily = false
    @Published var family: [String] = []
    
    var cancellables: Set<AnyCancellable> = []
    
    init() {
        $watchFamily
            .sink { self.fetch(watchFamily: $0) }
            .store(in: &cancellables)
    }
    
    func fetch(watchFamily: Bool) {
        family.removeAll()
        
        AppPublishers.familyPublisher(watchFamily: watchFamily)
            .sink { self.family.append($0) }
            .store(in: &cancellables)
    }
}

struct AnyPublisherExample: View {
    @StateObject var vm = AnyPublisherExampleViewModel()
    
    var body: some View {
        List {
            Section {
                    Toggle(isOn: $vm.watchFamily) {
                        Text("MY FAMILY")
                }
            }
            
            Section(header: Text("Family")) {
                ForEach(vm.family, id: \.self) { Text($0) }
            }
        }
    }
}

struct AnyPublisherExample_Previews: PreviewProvider {
    static var previews: some View {
        AnyPublisherExample()
    }
}

class AppPublishers {
    static func familyPublisher(watchFamily: Bool) -> AnyPublisher<String, Never> {
        if watchFamily {
            return ["Artem", "Oksana", "Demid", "Busya"].publisher
                .prepend("MY FAMILY")
                .eraseToAnyPublisher()
        } else {
            let url = URL(string: "https://fakeLink.com/api")!
            
            return URLSession.shared.dataTaskPublisher(for: url)
                .map { $0.data }
                .decode(type: String.self, decoder: JSONDecoder())
                .receive(on: RunLoop.main)
                .prepend("AWAY FAMILY")
                .replaceError(with: "It was an error: no members found")
                .eraseToAnyPublisher()
        }
    }
}
