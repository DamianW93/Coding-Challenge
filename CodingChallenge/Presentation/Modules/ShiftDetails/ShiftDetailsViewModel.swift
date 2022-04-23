//
//  ShiftDetailsViewModel.swift
//  CodingChallenge
//
//  Created by Damian Włodarczyk on 22/04/2022.
//

import Foundation

protocol ShiftDetailsViewModelProtocol: ObservableObject {
    var shift: ShiftModel { get }
}

final class ShiftDetailsViewModel: ShiftDetailsViewModelProtocol {
    let shift: ShiftModel
    
    init(shift: ShiftModel) {
        self.shift = shift
    }
}
