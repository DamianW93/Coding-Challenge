//
//  ShiftModelPresentationMock.swift
//  CodingChallenge
//
//  Created by Damian Włodarczyk on 23/04/2022.
//

import Foundation

enum ShiftModelPresentationMock {
    static let mocked: ShiftModel = .init(
        shiftId: 0,
        startDateTime: Date.now,
        endDateTime: (try? Date.from(
            string: "2022-04-21",
            with: Date.Format.yearMonthDay
        )) ?? Date.now,
        premiumRate: true,
        covid: true,
        shiftKind: .evening,
        withinDistance: 2.0,
        facilityType: ShiftFacilityTypeModel(
            id: 0,
            name: "Facility Name",
            color: "#433434"
        ),
        skill: ShiftSkillModel(
            id: 0,
            name: "Skill name",
            color: "#FFDD4E"),
        localizedSpecialty: ShiftLocalizedSpecialtyModel(
            id: 0,
            specialtyId: 0,
            stateId: 0,
            name: "Speciality Name",
            abbreviation: "SN",
            specialty: ShiftSpecialtyModel(
                id: 0,
                name: "Specialty Name",
                color: "#EEFFEE",
                abbreviation: "DD"
            )
        )
    )
}
