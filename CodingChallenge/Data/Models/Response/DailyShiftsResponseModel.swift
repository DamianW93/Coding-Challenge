//
//  DailyShiftsResponseModel.swift
//  CodingChallenge
//
//  Created by Damian Włodarczyk on 21/04/2022.
//

import Foundation

struct DailyShiftsResponseModel: Decodable {
    let date: Date
    let shifts: [ShiftResponseModel]
}
