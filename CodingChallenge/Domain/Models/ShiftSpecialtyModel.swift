//
//  ShiftSpecialtyModel.swift
//  CodingChallenge
//
//  Created by Damian Włodarczyk on 23/04/2022.
//

struct ShiftSpecialtyModel {
    let id: Int
    let name: String
    let color: String
    let abbreviation: String
}

extension ShiftSpecialtyModel {
    static func from(response: ShiftSpecialtyResponseModel) -> Self {
        .init(
            id: response.id,
            name: response.name,
            color: response.color,
            abbreviation: response.abbreviation
        )
    }
 }
