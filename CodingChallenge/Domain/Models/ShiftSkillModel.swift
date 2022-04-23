//
//  ShiftSkillModel.swift
//  CodingChallenge
//
//  Created by Damian Włodarczyk on 23/04/2022.
//

import Foundation

struct ShiftSkillModel {
    let id: Int
    let name: String
    let color: String
}

extension ShiftSkillModel {
    static func from(response: ShiftSkillResponseModel) -> Self {
        .init(
            id: response.id,
            name: response.name,
            color: response.color
        )
    }
}
