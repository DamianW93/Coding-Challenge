//
//  ShiftsType+Extension.swift
//  CodingChallengeTests
//
//  Created by Damian Włodarczyk on 23/04/2022.
//

@testable import CodingChallenge

extension ShiftsViewState: Equatable {
    public static func == (lhs: ShiftsViewState, rhs: ShiftsViewState) -> Bool {
        switch (lhs, rhs) {
        case (.loaded, .loaded),
            (.loading, .loading),
            (.loadingMore, .loadingMore),
            (.pagining, .pagining),
            (.refreshing, .refreshing):
            return true
        case (.error(let leftError), .error(let rightError)):
            return leftError == rightError
        default:
            return false
        }
    }
}
