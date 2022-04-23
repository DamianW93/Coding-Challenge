//
//  ShiftsViewModelMock.swift
//  CodingChallenge
//
//  Created by Damian Włodarczyk on 21/04/2022.
//

final class ShiftsViewModelPreviewMock: ShiftsViewModelProtocol {    
    var state: ShiftsViewState = .loaded
    var dailyShifts = [DailyShiftsModel]()
    var selectedShift: ShiftModel?
    
    func onAppear() async {}
    func onScrollDown() {}
    func onPullToRefresh() async {}
    func onShiftSelected(_ shift: ShiftModel) {}
}
