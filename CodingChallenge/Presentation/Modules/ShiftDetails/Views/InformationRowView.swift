//
//  InformationRowView.swift
//  CodingChallenge
//
//  Created by Damian Włodarczyk on 22/04/2022.
//

import SwiftUI

struct InformationRowView: View {
    let icon: Image
    let title: String
    let description: String?
    
    var body: some View {
        HStack(spacing: Dimens.l) {
            iconContainer
            texts
            Spacer()
        }
    }
    
    var iconContainer: some View {
        ZStack {
            Circle()
                .fill(Colors.primary.color.opacity(Dimens.defaultColorOpacity))
            icon
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(
                    maxWidth: Dimens.l,
                    maxHeight: Dimens.l,
                    alignment: .center
                )
                .foregroundColor(Colors.primary.color)
        }
        .frame(width: 40, height: 40, alignment: .center)
    }
    
    var texts: some View {
        VStack(alignment: .leading, spacing: Dimens.xxs) {
            Text(title)
                .font(.body)
                .fontWeight(.semibold)
            if let description = description {
                Text(description)
                    .font(.caption)
            }
        }
    }
}

struct InformationRowView_Previews: PreviewProvider {
    static var previews: some View {
        InformationRowView(
            icon: SystemImage.calendarIcon,
            title: "Test title",
            description: "Test description"
        )
    }
}
