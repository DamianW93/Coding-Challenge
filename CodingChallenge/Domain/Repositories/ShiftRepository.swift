//
//  ShiftRepository.swift
//  CodingChallenge
//
//  Created by Damian Włodarczyk on 20/04/2022.
//

import Foundation

protocol ShiftRepositoryProtocol {
    func fetchShifts(for date: Date) async throws -> [ShiftResponseModel]
}

final class ShiftRepository: ShiftRepositoryProtocol {
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    // TODO: Change return type to domain model
    func fetchShifts(for date: Date) async throws -> [ShiftResponseModel] {
        let shiftsResponse = try await networkService.request(
            type: ShiftsResponseModel.self,
            endpoint: ShiftEndpoints.shifts(.init(start: date, end: date))
        )
        
        return shiftsResponse.data.first?.shifts ?? []
    }
}
