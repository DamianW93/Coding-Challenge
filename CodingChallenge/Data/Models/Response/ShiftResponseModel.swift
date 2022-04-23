//
//  ShiftResponseModel.swift
//  CodingChallenge
//
//  Created by Damian Włodarczyk on 21/04/2022.
//

import Foundation

struct ShiftResponseModel: Decodable, Identifiable, Equatable {
    let shiftId: Int
    let normalizedStartDateTime: Date
    let normalizedEndDateTime: Date
    let premiumRate: Bool
    let covid: Bool
    let shiftKind: ShiftType
    let withinDistance: Double?
    let facilityType: ShiftFacilityTypeResponseModel
    let skill: ShiftSkillResponseModel
    let localizedSpecialty: ShiftLocalizedSpecialtyResponseModel
    
    // TODO: Move to domain model
    var id: Int {
        shiftId
    }
    
    static func == (lhs: ShiftResponseModel, rhs: ShiftResponseModel) -> Bool {
        lhs.id == rhs.id
    }
}
