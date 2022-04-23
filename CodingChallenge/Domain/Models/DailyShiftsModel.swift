//
//  DailyShiftsModel.swift
//  CodingChallenge
//
//  Created by Damian Włodarczyk on 23/04/2022.
//

import Foundation

struct DailyShiftsModel {
    let date: Date
    let shifts: [ShiftModel]
}

extension DailyShiftsModel: Identifiable {
    var id: Date {
        date
    }
}

extension DailyShiftsModel: Equatable {
    static func == (lhs: DailyShiftsModel, rhs: DailyShiftsModel) -> Bool {
        lhs.date == rhs.date
    }
}

extension DailyShiftsModel {
    static func from(response: DailyShiftsResponseModel) -> Self {
        .init(
            date: response.date,
            shifts: response.shifts.map(ShiftModel.from)
        )
    }
}
