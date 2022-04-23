//
//  ShiftDetailsViewModel.swift
//  CodingChallenge
//
//  Created by Damian Włodarczyk on 22/04/2022.
//

import Foundation

protocol ShiftDetailsViewModelProtocol: ObservableObject {
    var shift: ShiftResponseModel { get }
}

final class ShiftDetailsViewModel: ShiftDetailsViewModelProtocol {
    let shift: ShiftResponseModel
    
    init(shift: ShiftResponseModel) {
        self.shift = shift
    }
}
