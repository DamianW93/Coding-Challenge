//
//  ShiftDetailsViewModelPreviewMock.swift
//  CodingChallenge
//
//  Created by Damian Włodarczyk on 22/04/2022.
//

import Foundation

final class ShiftDetailsViewModelPreviewMock: ShiftDetailsViewModelProtocol {
    let shift: ShiftModel
    
    init() {
        shift = ShiftModelPresentationMock.mocked
    }    
}
