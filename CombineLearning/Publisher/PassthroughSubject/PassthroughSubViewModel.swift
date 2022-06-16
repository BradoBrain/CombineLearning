//
//  PassthroughSubViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 16.06.2022.
//

import Foundation
import Combine

// PassthroughSubject - publisher (like  the CurrentValueSubject) that doesn't hold on to a value.
// It allows us to create a pipeline to send value through.

enum PhoneNumberStatus {
    case ok
    case invalid
    case noEvaluated
}

class PassthroughSubViewModel: ObservableObject {
    @Published var phoneNumber = ""
    @Published var status = PhoneNumberStatus.noEvaluated
    
    let verifyPhoneNumber = PassthroughSubject<String, Never>() // It will not retain a value and expects a String
    
    init() {
        verifyPhoneNumber                                   // publisher will receive a String and not return any error
            .map { phoneNumber -> PhoneNumberStatus in      // but .map return an enum and store the result to status property
                if phoneNumber.count == 13 && phoneNumber.first == "+" {
                    return PhoneNumberStatus.ok
                } else {
                    return PhoneNumberStatus.invalid
                }
            }
            .assign(to: &$status) // becouse of there is no need to store a ref AnyCancellable
    }
    
}
