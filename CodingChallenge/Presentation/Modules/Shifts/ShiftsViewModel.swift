//
//  ShiftsViewModel.swift
//  CodingChallenge
//
//  Created by Damian Włodarczyk on 20/04/2022.
//

import Foundation

protocol ShiftsViewModelProtocol: ObservableObject {
    var state: ShiftsViewState { get }
    var shifts: [ShiftResponseModel] { get }
    var selectedShift: ShiftResponseModel? { get set }
    
    func onAppear() async
    func onScrollDown()
    func onPullToRefresh() async
    func onShiftSelected(_ shift: ShiftResponseModel)
}

final class ShiftsViewModel {
    @Published private(set) var shifts: [ShiftResponseModel] = []
    @Published private(set) var state: ShiftsViewState = .loaded
    @Published var selectedShift: ShiftResponseModel?
    
    private let shiftRepository: ShiftRepositoryProtocol
    
    private var fetchShiftsDate = Date.now
    
    init(shiftRepository: ShiftRepositoryProtocol) {
        self.shiftRepository = shiftRepository
    }
    
    @MainActor
    private func fetchShifts() async {
        do {
            let shifts = try await shiftRepository.fetchShifts(for: fetchShiftsDate)
            fetchShiftsDate = fetchShiftsDate.add(days: 1)
            
            if state.initialLoading {
                self.shifts = shifts
            } else {
                self.shifts.append(contentsOf: shifts)
            }
            
            self.state = shifts.isEmpty ? .loaded : .pagining
        } catch {
            self.state = .error(error)
        }
    }
}

extension ShiftsViewModel: ShiftsViewModelProtocol {
    @MainActor
    func onAppear() async {
        guard !state.isLoadingData else { return }
        
        state = .loading
        
        await fetchShifts()
    }
    
    func onScrollDown() {
        guard !state.isLoadingData else { return }
        
        state = .loadingMore
        
        Task { await fetchShifts() }
    }
    
    func onPullToRefresh() async {
        guard !state.isLoadingData else { return }
        
        state = .refreshing
        
        await fetchShifts()
    }
    
    func onShiftSelected(_ shift: ShiftResponseModel) {
        selectedShift = shift
    }
}
