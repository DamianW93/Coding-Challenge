//
//  ErrorView.swift
//  CodingChallenge
//
//  Created by Damian Włodarczyk on 21/04/2022.
//

import SwiftUI

struct ErrorView: View {
    let error: Error
    
    var body: some View {
        VStack(alignment: .center, spacing: 24.0) {
            Images.errorIcon.image
                .resizable()
                .padding(.horizontal, 40)
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 200)
            Text(error.localizedDescription)
                .font(.body)
                .multilineTextAlignment(.center)
        }
        .padding(.horizontal, 24.0)
        .allowsHitTesting(false)
    }
}

struct ErrorView_Preview: PreviewProvider {
    static var previews: some View {
        ErrorView(error: "Test error message")
    }
}
