//
//  FailedResponse.swift
//  CodingChallenge
//
//  Created by Damian Włodarczyk on 20/04/2022.
//

import Foundation

enum FailedResponse: LocalizedError {
    case noInternet
    case badRequest(code: Int)
    case unauthorized
    case server(ServerError)
    case unknown
    
    var errorDescription: String? {
        switch self {
        case .unknown: return L10n.errorUnknown()
        case .unauthorized: return L10n.errorAuthorization()
        case .noInternet: return L10n.errorNoInternet()
        case .server(let error): return error.message
        case .badRequest(let code): return L10n.errorServerProblem(code)
        }
    }
}
