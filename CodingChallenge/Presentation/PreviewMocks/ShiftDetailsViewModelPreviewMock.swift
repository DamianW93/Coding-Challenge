//
//  ShiftDetailsViewModelPreviewMock.swift
//  CodingChallenge
//
//  Created by Damian Włodarczyk on 22/04/2022.
//

import Foundation

final class ShiftDetailsViewModelPreviewMock: ShiftDetailsViewModelProtocol {
    let shift: ShiftResponseModel
    
    init() {
        shift = ShiftResponseModel(
            shiftId: 0,
            normalizedStartDateTime: Date.now,
            normalizedEndDateTime: (try? Date.from(
                string: "2022-04-21",
                with: Date.Format.yearMonthDay
            )) ?? Date.now,
            premiumRate: true,
            covid: true,
            shiftKind: .evening,
            withinDistance: 2.0,
            facilityType: ShiftFacilityTypeResponseModel(
                id: 0,
                name: "Facility Name",
                color: "#433434"
            ),
            skill: ShiftSkillResponseModel(
                id: 0,
                name: "Skill name",
                color: "#FFDD4E"),
            localizedSpecialty: ShiftLocalizedSpecialtyResponseModel(
                id: 0,
                specialtyId: 0,
                stateId: 0,
                name: "Speciality Name",
                abbreviation: "SN",
                specialty: ShiftSpecialtyResponseModel(
                    id: 0,
                    name: "Specialty Name",
                    color: "#EEFFEE",
                    abbreviation: "DD"
                )
            )
        )
    }
    
}
