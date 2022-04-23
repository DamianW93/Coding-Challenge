//
//  ShiftsViewState.swift
//  CodingChallenge
//
//  Created by Damian Włodarczyk on 21/04/2022.
//

enum ShiftsViewState {
    case loading
    case loadingMore
    case refreshing
    case pagining
    case loaded
    case error(String)
}

extension ShiftsViewState {
    var isLoadingData: Bool {
        switch self {
        case .loading, .loadingMore, .refreshing:
            return true
        case .pagining, .loaded, .error:
            return false
        }
    }
    
    var initialLoading: Bool {
        switch self {
        case .loading, .refreshing:
            return true
        case .loadingMore, .pagining, .loaded, .error:
            return false
        }
    }
    
    var showPaginingIndicator: Bool {
        switch self {
        case .pagining, .loadingMore:
            return true
        case .refreshing, .loading, .loaded, .error:
            return false
        }
    }
}
