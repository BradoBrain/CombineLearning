//
//  FailViewModel.swift
//  CombineLearning
//
//  Created by Artem Vinogradov on 14.06.2022.
//

import Foundation
import Combine

enum InvalidNumError: Error {
    case lessThanZero
    case moreThanTen
}


class FailViewModel: ObservableObject {

    @Published var num = 0
    @Published var error: InvalidNumError?
    
    
    func save(num: Int) {
        _ = Validator.validValue(num: num) // we alredy has a logic in this publisher from Validator
            .sink(receiveCompletion: { [unowned self] completion in
                if case .failure(let error) = completion {
                    self.error = error
                }
            }, receiveValue: { [unowned self] num in
                self.num = num
            })
    }
}


class Validator: Identifiable, ObservableObject {

    
    static func validValue(num: Int) -> AnyPublisher<Int, InvalidNumError> { // Able to return different publisher
        if num < 0 {
            return Fail(error: InvalidNumError.lessThanZero)
                .eraseToAnyPublisher() // We use it to make all a common type of publisher that returns an Int or InvalidNumError
        } else if num > 10 {
            return Fail(error: InvalidNumError.moreThanTen)
                .eraseToAnyPublisher()
        }
        
        return Just(num)
            .setFailureType(to: InvalidNumError.self) // In coomon way Just publisher doesn't throw an error. We use it to match up the failure types
            .eraseToAnyPublisher()
    }
}


extension InvalidNumError: CustomStringConvertible {
    public var description: String {
        switch self {
        
        case .lessThanZero:
            return "Less Than Zero"
        case .moreThanTen:
            return "More Than Ten"
        }
    }
}
