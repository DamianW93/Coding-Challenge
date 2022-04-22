//
//  ShiftsView.swift
//  CodingChallenge
//
//  Created by Brady Miller on 4/7/21.
//

import SwiftUI

struct ShiftsView<ViewModel: ShiftsViewModelProtocol>: View {
    @ObservedObject private(set) var viewModel: ViewModel
    
    var body: some View {
        NavigationView {
            contentView()
                .navigationTitle(L10n.shiftsListTitle())
                .onAppear {
                    Task { await viewModel.onAppear() }
                }
        }
    }
    
    private func contentView() -> some View {
        List {
            ForEach(viewModel.shifts) { shift in
                ShiftListCellView(shiftModel: shift)
                    .listRowSeparator(.hidden)
            }
            if viewModel.state.showPaginingIndicator {
                LoadingView()
                    .onAppear { viewModel.onScrollDown() }
            }
        }
        .animation(.default, value: viewModel.shifts)
        .listStyle(.plain)
        .refreshable { await viewModel.onPullToRefresh() }
        .overlay(alignment: .center) {
            switch viewModel.state {
            case .loading:
                LoadingView()
            case .error(let error):
                ErrorView(error: error)
            default: EmptyView()
            }
        }
    }
}

struct ShiftsView_Previews: PreviewProvider {
    static var previews: some View {
        ShiftsView(viewModel: ShiftsViewModelPreviewMock())
    }
}
