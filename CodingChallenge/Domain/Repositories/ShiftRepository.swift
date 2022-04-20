//
//  ShiftRepository.swift
//  CodingChallenge
//
//  Created by Damian Włodarczyk on 20/04/2022.
//

protocol ShiftRepositoryProtocol {
    func fetchShifts() async throws -> String
}

final class ShiftRepository: ShiftRepositoryProtocol {
    private let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func fetchShifts() async throws -> String {
        try await networkService.request(type: String.self, endpoint: ShiftEndpoints.shifts)
    }
}
