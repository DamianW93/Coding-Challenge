//
//  ShiftEndpoints.swift
//  CodingChallenge
//
//  Created by Damian Włodarczyk on 18/04/2022.
//

import Foundation

enum ShiftEndpoints: Endpoint {
    case shifts
    
    var path: String {
        switch self {
        case .shifts: return "shifts"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .shifts: return .get()
        }
    }
}
