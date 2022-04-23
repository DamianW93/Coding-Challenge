//
//  ShiftsViewModelMock.swift
//  CodingChallenge
//
//  Created by Damian Włodarczyk on 21/04/2022.
//

import Foundation

final class ShiftsViewModelPreviewMock: ShiftsViewModelProtocol {    
    var state: ShiftsViewState = .loaded
    var dailyShifts: [DailyShiftsModel] = [
        .init(
            date: Date.now,
            shifts: [
                ShiftModelPresentationMock.mocked,
                ShiftModelPresentationMock.mocked,
                ShiftModelPresentationMock.mocked,
                ShiftModelPresentationMock.mocked,
                ShiftModelPresentationMock.mocked,
                ShiftModelPresentationMock.mocked
            ]
        )
    ]
    var selectedShift: ShiftModel?
    
    func onAppear() async {}
    func onScrollDown() {}
    func onPullToRefresh() async {}
    func onShiftSelected(_ shift: ShiftModel) {}
}
