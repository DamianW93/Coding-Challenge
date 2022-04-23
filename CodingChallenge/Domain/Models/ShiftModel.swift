//
//  ShiftModel.swift
//  CodingChallenge
//
//  Created by Damian Włodarczyk on 23/04/2022.
//

import Foundation

struct ShiftModel {
    let shiftId: Int
    let startDateTime: Date
    let endDateTime: Date
    let premiumRate: Bool
    let covid: Bool
    let shiftKind: ShiftType
    let withinDistance: Double?
    let facilityType: ShiftFacilityTypeModel
    let skill: ShiftSkillModel
    let localizedSpecialty: ShiftLocalizedSpecialtyModel
}

extension ShiftModel: Identifiable {
    var id: Int {
        shiftId
    }
}

extension ShiftModel: Equatable {
    static func == (lhs: ShiftModel, rhs: ShiftModel) -> Bool {
        lhs.id == rhs.id
    }
}

extension ShiftModel {
    static func from(response: ShiftResponseModel) -> Self {
        .init(
            shiftId: response.shiftId,
            startDateTime: response.normalizedStartDateTime,
            endDateTime: response.normalizedEndDateTime,
            premiumRate: response.premiumRate,
            covid: response.covid,
            shiftKind: response.shiftKind,
            withinDistance: response.withinDistance,
            facilityType: ShiftFacilityTypeModel.from(response: response.facilityType),
            skill: ShiftSkillModel.from(response: response.skill),
            localizedSpecialty: ShiftLocalizedSpecialtyModel.from(response: response.localizedSpecialty)
        )
    }
}
