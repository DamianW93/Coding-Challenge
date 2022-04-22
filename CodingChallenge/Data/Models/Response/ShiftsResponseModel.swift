//
//  ShiftsResponseModel.swift
//  CodingChallenge
//
//  Created by Damian Włodarczyk on 21/04/2022.
//

import Foundation

struct ShiftsResponseModel: Decodable {
    let data: [DailyShiftsResponseModel]
}
