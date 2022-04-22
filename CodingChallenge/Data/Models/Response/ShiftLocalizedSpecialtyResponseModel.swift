//
//  ShiftLocalizedSpecialtyResponseModel.swift
//  CodingChallenge
//
//  Created by Damian Włodarczyk on 21/04/2022.
//

import Foundation

struct ShiftLocalizedSpecialtyResponseModel: Decodable {
    let id: Int
    let specialtyId: Int
    let stateId: Int
    let name: String
    let abbreviation: String
    let specialty: ShiftSpecialtyResponseModel
}
