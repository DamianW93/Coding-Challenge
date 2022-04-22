//
//  ShiftListView.swift
//  CodingChallenge
//
//  Created by Damian Włodarczyk on 21/04/2022.
//

import SwiftUI

struct ShiftListCellView: View {
    let shiftModel: ShiftResponseModel
    
    var body: some View {
        contentView
    }
    
    private var contentView: some View {
        ZStack(alignment: .topLeading) {
            Color.white
            VStack(alignment: .leading, spacing: 12.0) {
                header
                facility
            }.padding(.all, 16.0)
        }
        .cornerRadius(16.0)
        .shadow(color: .gray.opacity(0.3), radius: 6, x: 0, y: 0)
    }
    
    private var header: some View {
        HStack(spacing: 8.0) {
            Text("\(shiftModel.normalizedStartDateTime.format(.time)) - \(shiftModel.normalizedEndDateTime.format(.time))")
                .font(.caption)
            Spacer()
            if shiftModel.premiumRate {
                Image(systemName: "star.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.yellow)
                    .frame(width: 15, height: 15, alignment: .center)
            }
            Text(shiftModel.localizedSpecialty.abbreviation)
                .font(.caption)
        }
    }
    
    private var facility: some View {
        VStack(alignment: .leading, spacing: 12.0) {
            Text(shiftModel.facilityType.name)
                .font(.body)
                .fontWeight(.bold)
            HStack {
                Text(shiftModel.skill.name)
                    .font(.caption2)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
                    .background(
                        Capsule()
                            .fill(Color(hex: shiftModel.skill.color))
                    )
                Spacer()
                if shiftModel.covid {
                    Images.covidVaccineIcon.image
                        .resizable()
                        .frame(width: 20, height: 20)
                        .aspectRatio(contentMode: .fit)
                }
            }
        }
    }
}

struct TransactionCellView_Previews: PreviewProvider {
    static var previews: some View {
        ShiftListCellView(shiftModel: ShiftResponseModel(
            shiftId: 0,
            normalizedStartDateTime: Date.now,
            normalizedEndDateTime: (try? Date.from(
                string: "2022-04-21",
                with: Date.Format.yearMonthDay
            )) ?? Date.now,
            premiumRate: true,
            covid: true,
            shiftKind: "Day Shift",
            withinDistance: 2.0,
            facilityType: ShiftFacilityTypeResponseModel(
                id: 0,
                name: "Facility Name",
                color: "#433434"
            ),
            skill: ShiftSkillResponseModel(
                id: 0,
                name: "Skill name",
                color: "#FFDD4E"),
            localizedSpecialty: ShiftLocalizedSpecialtyResponseModel(
                id: 0,
                specialtyId: 0,
                stateId: 0,
                name: "Speciality Name",
                abbreviation: "SN",
                specialty: ShiftSpecialtyResponseModel(
                    id: 0,
                    name: "Specialty Name",
                    color: "#EEFFEE",
                    abbreviation: "DD"
                )
            )
        ))
        .previewLayout(.fixed(width: 375.0, height: 120.0))
    }
}
