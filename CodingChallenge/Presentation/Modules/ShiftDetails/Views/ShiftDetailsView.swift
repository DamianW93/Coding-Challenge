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
                VStack(alignment: .leading, spacing: 16.0) {
                    basicInfoStackView
                    Spacer()
                }
                .padding(.vertical, 16.0)
            }
            .navigationTitle(viewModel.shift.facilityType.name)
        }
    }
    
    var basicInfoStackView: some View {
        VStack(spacing: 14.0) {
            InformationRowView(
                icon: Image(systemName: "calendar"),
                title: viewModel.shift.normalizedStartDateTime.format(.descriptiveDate).capitalized,
                description: "\(viewModel.shift.normalizedStartDateTime.format(.time)) - \(viewModel.shift.normalizedEndDateTime.format(.time))"
            )
            InformationRowView(
                icon: shiftImage,
                title: viewModel.shift.shiftKind.rawValue,
                description: nil
            )
            InformationRowView(
                icon: Image(systemName: "book.fill"),
                title: viewModel.shift.skill.name,
                description: nil
            )
            InformationRowView(
                icon: Image(systemName: "graduationcap.fill"),
                title: viewModel.shift.localizedSpecialty.specialty.name,
                description: nil
            )
            if viewModel.shift.premiumRate {
                InformationRowView(
                    icon: Image(systemName: "star.fill"),
                    title: L10n.shiftDetailsPremiumRate(),
                    description: nil
                )
            }
            if viewModel.shift.covid {
                InformationRowView(
                    icon: Images.covidVaccineIcon.image,
                    title: L10n.shiftDetailsCovidVaccinationNeeded(),
                    description: nil
                )
            }
        }
        .padding(.horizontal, 16.0)
    }
    
    var shiftImage: Image {
        switch viewModel.shift.shiftKind {
        case .day:
            return Image(systemName: "sun.max.fill")
        case .evening:
            return Image(systemName: "sun.and.horizon.fill")
        case .night:
            return Image(systemName: "moon.fill")
        }
    }
}

struct ShiftDetails_Previews: PreviewProvider {
    static var previews: some View {
        ShiftDetails(viewModel: ShiftDetailsViewModelPreviewMock())
    }
}
