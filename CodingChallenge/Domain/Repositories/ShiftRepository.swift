//
//  ShiftRepository.swift
//  CodingChallenge
//
//  Created by Damian Włodarczyk on 20/04/2022.
//

import Foundation

protocol ShiftRepositoryProtocol {
    func fetchShifts(for date: Date) async throws -> DailyShiftsModel
}

final class ShiftRepository: ShiftRepositoryProtocol {
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func fetchShifts(for date: Date) async throws -> DailyShiftsModel {
        let dailyShiftsResponse = try await networkService.request(
            type: ShiftsResponseModel.self,
            endpoint: ShiftEndpoints.shifts(.init(start: date, end: date))
        )
        
        let dailyShifts = DailyShiftsModel.from(
            response: dailyShiftsResponse.data.first ?? .init(date: date, shifts: [])
        )
        
        return dailyShifts
    }
}
