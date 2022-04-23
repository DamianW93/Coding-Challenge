//
//  ShiftListView.swift
//  CodingChallenge
//
//  Created by Damian Włodarczyk on 21/04/2022.
//

import SwiftUI

struct ShiftListCellView: View {
    let shiftModel: ShiftModel
    
    var body: some View {
        contentView
    }
    
    private var contentView: some View {
        ZStack(alignment: .topLeading) {
            Color.white
            VStack(alignment: .leading, spacing: Dimens.m) {
                header
                facility
            }.padding(.all, Dimens.l)
        }
        .cornerRadius(Dimens.l)
        .shadow(
            color: .gray.opacity(Dimens.shadowOpacity),
            radius: 6,
            x: 0,
            y: 0
        )
    }
    
    private var header: some View {
        HStack(spacing: Dimens.s) {
            Text("\(shiftModel.startDateTime.format(.time)) - \(shiftModel.endDateTime.format(.time))")
                .font(.caption)
            Spacer()
            if shiftModel.premiumRate {
                SystemImage.starIcon
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.yellow)
                    .frame(
                        width: Dimens.l,
                        height: Dimens.l,
                        alignment: .center
                    )
            }
            Text(shiftModel.localizedSpecialty.abbreviation)
                .font(.caption)
        }
    }
    
    private var facility: some View {
        VStack(alignment: .leading, spacing: Dimens.m) {
            Text(shiftModel.facilityType.name)
                .font(.body)
                .fontWeight(.bold)
            HStack {
                Text(shiftModel.skill.name)
                    .font(.caption2)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.horizontal, Dimens.s)
                    .padding(.vertical, Dimens.xs)
                    .background(
                        Capsule()
                            .fill(Color(hex: shiftModel.skill.color))
                    )
                Spacer()
                if shiftModel.covid {
                    SystemImage.covidIcon
                        .resizable()
                        .frame(width: Dimens.xl, height: Dimens.xl)
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Colors.primary.color)
                }
            }
        }
    }
}

struct TransactionCellView_Previews: PreviewProvider {
    static var previews: some View {
        ShiftListCellView(shiftModel: ShiftModelPresentationMock.mocked)
        .previewLayout(.fixed(width: 375.0, height: 120.0))
    }
}
