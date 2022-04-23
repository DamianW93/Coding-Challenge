//
//  DailyShiftsModelMock.swift
//  CodingChallengeTests
//
//  Created by Damian Włodarczyk on 23/04/2022.
//

import Foundation
@testable import CodingChallenge

enum DailyShiftsModelMock {
    static let mocked: DailyShiftsModel = .init(
        date: Date.now,
        shifts: [
            ShiftModelMock.mocked,
            ShiftModelMock.mocked,
            ShiftModelMock.mocked,
            ShiftModelMock.mocked
        ]
    )
}
