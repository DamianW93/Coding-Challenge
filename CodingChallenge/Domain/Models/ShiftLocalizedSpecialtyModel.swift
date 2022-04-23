//
//  ShiftLocalizedSpecialtyModel.swift
//  CodingChallenge
//
//  Created by Damian Włodarczyk on 23/04/2022.
//

import Foundation

struct ShiftLocalizedSpecialtyModel {
    let id: Int
    let specialtyId: Int
    let stateId: Int
    let name: String
    let abbreviation: String
    let specialty: ShiftSpecialtyModel
}

extension ShiftLocalizedSpecialtyModel {
    static func from(response: ShiftLocalizedSpecialtyResponseModel) -> Self {
        .init(
            id: response.id,
            specialtyId: response.specialtyId,
            stateId: response.stateId,
            name: response.name,
            abbreviation: response.abbreviation,
            specialty: ShiftSpecialtyModel.from(response: response.specialty)
        )
    }
}
