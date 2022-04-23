//
//  ShiftDetailsView.swift
//  CodingChallenge
//
//  Created by Damian Włodarczyk on 22/04/2022.
//

import SwiftUI

struct ShiftDetails<ViewModel: ShiftDetailsViewModelProtocol>: View {
    @ObservedObject private(set) var viewModel: ViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: Dimens.l) {
                    basicInfoStackView
                    Spacer()
                }
                .padding(.vertical, Dimens.l)
            }
            .navigationTitle(viewModel.shift.facilityType.name)
        }
    }
    
    var basicInfoStackView: some View {
        VStack(spacing: Dimens.m) {
            InformationRowView(
                icon: SystemImage.calendarIcon,
                title: viewModel.shift.startDateTime.format(.descriptiveDate).capitalized,
                description: "\(viewModel.shift.startDateTime.format(.time)) - \(viewModel.shift.endDateTime.format(.time))"
            )
            InformationRowView(
                icon: shiftImage,
                title: viewModel.shift.shiftKind.rawValue,
                description: nil
            )
            InformationRowView(
                icon: SystemImage.bookIcon,
                title: viewModel.shift.skill.name,
                description: nil
            )
            InformationRowView(
                icon: SystemImage.specialtyIcon,
                title: viewModel.shift.localizedSpecialty.specialty.name,
                description: nil
            )
            if viewModel.shift.premiumRate {
                InformationRowView(
                    icon: SystemImage.starIcon,
                    title: L10n.shiftDetailsPremiumRate(),
                    description: nil
                )
            }
            if viewModel.shift.covid {
                InformationRowView(
                    icon: SystemImage.covidIcon,
                    title: L10n.shiftDetailsCovidVaccinationNeeded(),
                    description: nil
                )
            }
        }
        .padding(.horizontal, Dimens.l)
    }
    
    var shiftImage: Image {
        switch viewModel.shift.shiftKind {
        case .day:
            return SystemImage.dayIcon
        case .evening:
            return SystemImage.eveningIcon
        case .night:
            return SystemImage.nightIcon
        }
    }
}

struct ShiftDetails_Previews: PreviewProvider {
    static var previews: some View {
        ShiftDetails(viewModel: ShiftDetailsViewModelPreviewMock())
    }
}
