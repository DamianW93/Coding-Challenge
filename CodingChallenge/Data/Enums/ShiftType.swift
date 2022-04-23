//
//  ShiftType.swift
//  CodingChallenge
//
//  Created by Damian Włodarczyk on 23/04/2022.
//

enum ShiftType: String, Decodable {
    case day = "Day Shift"
    case evening = "Evening Shift"
    case night = "Night Shift"
}
