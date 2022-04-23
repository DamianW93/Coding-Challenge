//
//  ShiftFacilityType.swift
//  CodingChallenge
//
//  Created by Damian Włodarczyk on 23/04/2022.
//

import Foundation

struct ShiftFacilityTypeModel {
    let id: Int
    let name: String
    let color: String
}

extension ShiftFacilityTypeModel {
    static func from(response: ShiftFacilityTypeResponseModel) -> Self {
        .init(
            id: response.id,
            name: response.name,
            color: response.color
        )
    }
}
