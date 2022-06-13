//
//  StoreInViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 13.06.2022.
//

import Foundation
import Combine

class StoreInViewModel: ObservableObject {
    @Published var login = ""
    @Published var loginValidation = ""
    @Published var password = ""
    @Published var passwordValidation = ""
    
    private var multiCancellable: Set<AnyCancellable> = [] // Use Set becouse of it allows only unique elements
    
    init() {
        $login
            .map { login in
                login.count >= 5 ? "Good login" : "Your login is too short"
            }
            .sink { [unowned self] value in
                self.loginValidation = value
            }
            .store(in: &multiCancellable) // We use store(in:) instead assign(to:) becouse of we need to add more than one property
        
        $password
            .map { passw in
                passw.count >= 8 ? "Strong password" : "Your password is too weak"
            }
            .sink { [unowned self] value in
                self.passwordValidation = value
            }
            .store(in: &multiCancellable)
    }
    
    func cancelAllValidation() {
        multiCancellable.removeAll()
    }
    
}
