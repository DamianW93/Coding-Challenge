//
//  GetShiftsRequestModel.swift
//  CodingChallenge
//
//  Created by Damian Włodarczyk on 21/04/2022.
//

import Foundation

struct GetShiftsRequestModel: QueryEncodableRequest {
    // Type is hardcoded just for simplicity as we want to fetch just one day at a time.
    let type: String = "list"
    // Hardcoded address as stated in readme
    let address: String = "Dallas, TX"
    let start: Date
    let end: Date
}
