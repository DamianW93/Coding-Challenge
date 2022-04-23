//
//  ShiftsRepositoryMock.swift
//  CodingChallengeTests
//
//  Created by Damian Włodarczyk on 23/04/2022.
//

import Foundation
@testable import CodingChallenge

final class ShiftsRepositoryMock: ShiftRepositoryProtocol {
    private(set) var fetchShiftsCalled: Bool = false
    private(set) var fetchShiftsDateArgument: Date?
    
    var fetchShiftsReturnValue: DailyShiftsModel?
    var fetchShiftsError: Error?
    
    func fetchShifts(for date: Date) async throws -> DailyShiftsModel {
        fetchShiftsDateArgument = date
        fetchShiftsCalled = true
        
        if let fetchShiftsReturnValue = fetchShiftsReturnValue {
            return fetchShiftsReturnValue
        } else if let fetchShiftsError = fetchShiftsError {
            throw fetchShiftsError
        } else {
            return DailyShiftsModelMock.mocked
        }
    }
}
