//
//  ParametersConvertible.swift
//  CodingChallenge
//
//  Created by Damian Włodarczyk on 21/04/2022.
//

import Foundation

protocol ParametersConvertible {
    var parameters: [String: Any] { get }
}

extension ParametersConvertible where Self: Encodable {
    var parameters: [String: Any] {
        guard let data = try? JSONEncoder().encode(self),
              let dict = (try? JSONSerialization.jsonObject(with: data, options: [])) as? [String: Any] else {
            return [:]
        }

        return dict
    }
}
