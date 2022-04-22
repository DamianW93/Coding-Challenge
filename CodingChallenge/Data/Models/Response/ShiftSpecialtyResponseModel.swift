//
//  ShiftSpecialtyResponseModel.swift
//  CodingChallenge
//
//  Created by Damian Włodarczyk on 21/04/2022.
//

import Foundation

struct ShiftSpecialtyResponseModel: Decodable {
    let id: Int
    let name: String
    let color: String
    let abbreviation: String
}
