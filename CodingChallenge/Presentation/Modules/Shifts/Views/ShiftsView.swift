//
//  ShiftsView.swift
//  CodingChallenge
//
//  Created by Brady Miller on 4/7/21.
//

import SwiftUI

struct ShiftsView<ViewModel: ShiftsViewModelProtocol>: View {
    @ObservedObject private(set) var viewModel: ViewModel
    let shiftModuleFactory: ShiftModuleFactoryProtocol
    
    var body: some View {
        NavigationView {
            contentView()
                .navigationTitle(L10n.shiftsListTitle())
                .onAppear {
                    Task { await viewModel.onAppear() }
                }
        }
        .sheet(item: $viewModel.selectedShift) { shift in
            shiftModuleFactory.buildShiftDetails(shift: shift)
        }
    }
    
    private func contentView() -> some View {
        List {
            ForEach(viewModel.dailyShifts) { dailyShift in
                Section(dailyShift.date.format(.descriptiveDate).capitalized) {
                    ForEach(dailyShift.shifts) { shift in
                        ShiftListCellView(shiftModel: shift)
                            .listRowSeparator(.hidden)
                            .onTapGesture {
                                viewModel.onShiftSelected(shift)
                            }
                    }
                }
            }
            if viewModel.state.showPaginingIndicator {
                LoadingView()
                    .onAppear {
                        Task { await viewModel.onScrollDown() }
                    }
            }
        }
        .animation(.default, value: viewModel.dailyShifts)
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
        ShiftsView(
            viewModel: ShiftsViewModelPreviewMock(),
            shiftModuleFactory: SHiftModuleFactoryMock()
        )
    }
}
