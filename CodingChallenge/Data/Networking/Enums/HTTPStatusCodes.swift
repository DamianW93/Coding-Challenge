//
//  HTTPStatusCodes.swift
//  CodingChallenge
//
//  Created by Damian Włodarczyk on 20/04/2022.
//

enum HTTPStatusCodes {
    static let successCodes = 200..<300
    static let badRequest = 400
    static let unauthorized = 401
    static let clientErrors = 402...499
    static let notFound = 404
    static let serverErrors = 500...599
}
