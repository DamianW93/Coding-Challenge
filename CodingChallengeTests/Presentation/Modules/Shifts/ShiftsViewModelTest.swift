//
//  ShiftsViewModelTest.swift
//  CodingChallengeTests
//
//  Created by Damian Włodarczyk on 23/04/2022.
//

import XCTest
import Combine
@testable import CodingChallenge

final class ShiftsViewModelTest: XCTestCase {
    private var sut: ShiftsViewModel!
    private var shiftsRepository: ShiftsRepositoryMock!
    private var subscribers = Set<AnyCancellable>()
    
    override func setUp() {
        super.setUp()
        
        shiftsRepository = ShiftsRepositoryMock()
        sut = ShiftsViewModel(shiftRepository: shiftsRepository)
    }
    
    // MARK: Initial state
    func test_initialState() {
        XCTAssertEqual(sut.dailyShifts, [])
        XCTAssertEqual(sut.selectedShift, nil)
        XCTAssertEqual(sut.state, .loaded)
    }
    
    // MARK: onApper()
    func test_onAppear_callsFetchShifts() async throws {
        await sut.onAppear()
        
        XCTAssertTrue(shiftsRepository.fetchShiftsCalled)
    }
    
    func test_onAppear_updatesStateToLoading() async throws {
        var states: [ShiftsViewState] = []
        
        sut.$state
            .dropFirst() // Ommit initial state
            .sink { state in
                states.append(state)
            }
            .store(in: &subscribers)
        
        await sut.onAppear()
        
        XCTAssertEqual(states.first, .loading)
    }
    
    func test_onAppear_successResponse_containsProperState() async throws {
        await sut.onAppear()
        
        XCTAssertEqual(sut.state, .pagining)
        XCTAssertEqual(sut.dailyShifts, [DailyShiftsModelMock.mocked])
        XCTAssertEqual(sut.selectedShift, nil)
    }
    
    func test_onAppear_emptySuccessResponse_containsProperState() async throws {
        let date = Date.now
        let emptyDailyShifts = DailyShiftsModel(date: date, shifts: [])
        shiftsRepository.fetchShiftsReturnValue = emptyDailyShifts
        
        await sut.onAppear()
        
        XCTAssertEqual(sut.state, .loaded)
        XCTAssertEqual(sut.dailyShifts, [emptyDailyShifts])
        XCTAssertEqual(sut.selectedShift, nil)
    }
    
    func test_onAppear_errorResponse_containsProperState() async throws {
        let error = "Fetch shifts error"
        shiftsRepository.fetchShiftsError = error
        
        await sut.onAppear()
        
        XCTAssertEqual(sut.state, .error(error.localizedDescription))
        XCTAssertEqual(sut.dailyShifts, [])
        XCTAssertEqual(sut.selectedShift, nil)
    }
    
    // MARK: onScrollDown()
    func test_onScrollDown_callsFetchShifts() async throws {
        await sut.onScrollDown()
        
        XCTAssertTrue(shiftsRepository.fetchShiftsCalled)
    }
    
    func test_onScrollDown_updatesStateToLoadingMore() async throws {
        var states: [ShiftsViewState] = []
        
        sut.$state
            .dropFirst() // Ommit initial state
            .sink { state in
                states.append(state)
            }
            .store(in: &subscribers)
        
        await sut.onScrollDown()
        
        XCTAssertEqual(states.first, .loadingMore)
    }
    
    func test_onScrollDown_successResponse_containsProperState() async throws {
        await sut.onScrollDown()
        
        XCTAssertEqual(sut.state, .pagining)
        XCTAssertEqual(sut.dailyShifts, [DailyShiftsModelMock.mocked])
        XCTAssertEqual(sut.selectedShift, nil)
    }
    
    func test_onScrollDown_emptySuccessResponse_containsProperState() async throws {
        let date = Date.now
        let emptyDailyShifts = DailyShiftsModel(date: date, shifts: [])
        shiftsRepository.fetchShiftsReturnValue = emptyDailyShifts
        
        await sut.onScrollDown()
        
        XCTAssertEqual(sut.state, .loaded)
        XCTAssertEqual(sut.dailyShifts, [emptyDailyShifts])
        XCTAssertEqual(sut.selectedShift, nil)
    }
    
    func test_onScrollDown_errorResponse_containsProperState() async throws {
        let error = "Fetch shifts error"
        shiftsRepository.fetchShiftsError = error
        
        await sut.onScrollDown()
        
        XCTAssertEqual(sut.state, .error(error.localizedDescription))
        XCTAssertEqual(sut.dailyShifts, [])
        XCTAssertEqual(sut.selectedShift, nil)
    }
    
    // MARK: onPullToRefresh()
    func test_onPullToRefresh_callsFetchShifts() async throws {
        await sut.onPullToRefresh()
        
        XCTAssertTrue(shiftsRepository.fetchShiftsCalled)
    }
    
    func test_onPullToRefresh_updatesStateToRefreshing() async throws {
        var states: [ShiftsViewState] = []
        
        sut.$state
            .dropFirst() // Ommit initial state
            .sink { state in
                states.append(state)
            }
            .store(in: &subscribers)
        
        await sut.onPullToRefresh()
        
        XCTAssertEqual(states.first, .refreshing)
    }
    
    func test_onPullToRefresh_successResponse_containsProperState() async throws {
        // Calls onAppear() to populate dailyShifts with some content to be refreshed
        await sut.onAppear()
        
        await sut.onPullToRefresh()
        
        XCTAssertEqual(sut.state, .pagining)
        XCTAssertEqual(sut.dailyShifts, [DailyShiftsModelMock.mocked])
        XCTAssertEqual(sut.selectedShift, nil)
    }
    
    func test_onPullToRefresh_emptySuccessResponse_containsProperState() async throws {
        let date = Date.now
        let emptyDailyShifts = DailyShiftsModel(date: date, shifts: [])
        shiftsRepository.fetchShiftsReturnValue = emptyDailyShifts
        
        await sut.onPullToRefresh()
        
        XCTAssertEqual(sut.state, .loaded)
        XCTAssertEqual(sut.dailyShifts, [emptyDailyShifts])
        XCTAssertEqual(sut.selectedShift, nil)
    }
    
    func test_onPullToRefresh_errorResponse_containsProperState() async throws {
        let error = "Fetch shifts error"
        shiftsRepository.fetchShiftsError = error
        
        await sut.onPullToRefresh()
        
        XCTAssertEqual(sut.state, .error(error.localizedDescription))
        XCTAssertEqual(sut.dailyShifts, [])
        XCTAssertEqual(sut.selectedShift, nil)
    }
    
    func test_onPullToRefresh_sendsTheSameDateAsInitialOnSecondCall() async throws {
        await sut.onAppear()
        
        let firstDate = shiftsRepository.fetchShiftsDateArgument!
        
        await sut.onPullToRefresh()
        
        let secondDate = shiftsRepository.fetchShiftsDateArgument!
        
        XCTAssertTrue(Calendar.current.isDate(
            firstDate,
            equalTo: secondDate,
            toGranularity: .day
        ))
    }
    
    // MARK: fetchShifts
    func test_fetchShifts_sendsDateOneDayAfterOnSecondCall() async throws {
        await sut.onAppear()
        
        let firstDate = shiftsRepository.fetchShiftsDateArgument!
        
        await sut.onScrollDown()
        
        let secondDate = shiftsRepository.fetchShiftsDateArgument!
        
        XCTAssertTrue(Calendar.current.isDate(
            firstDate.add(days: 1),
            equalTo: secondDate,
            toGranularity: .day
        ))
    }
    
    // MARK: onShiftSelected
    func test_onShiftSelected_updatesSelectedShiftValue() async throws {
        sut.onShiftSelected(ShiftModelMock.mocked)

        XCTAssertEqual(sut.selectedShift, ShiftModelMock.mocked)
    }
    
    override func tearDown() {
        super.tearDown()
        subscribers.forEach { $0.cancel() }
    }
}
