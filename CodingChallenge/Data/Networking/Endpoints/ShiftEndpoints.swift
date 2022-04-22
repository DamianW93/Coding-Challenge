//
//  ShiftEndpoints.swift
//  CodingChallenge
//
//  Created by Damian Włodarczyk on 18/04/2022.
//

import Foundation

enum ShiftEndpoints: Endpoint {
    case shifts(GetShiftsRequestModel)
    
    var path: String {
        switch self {
        case .shifts: return "available_shifts"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .shifts(let requestModel): return .get(requestModel.queryItems)
        }
    }
}
