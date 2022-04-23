//
//  LoadingView.swift
//  CodingChallenge
//
//  Created by Damian Włodarczyk on 21/04/2022.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color.white
                .opacity(0.7)
                .blur(radius: 20)
                .ignoresSafeArea()
            ProgressView()
                .scaleEffect(1.5, anchor: .center)
                .progressViewStyle(
                    CircularProgressViewStyle(tint: Colors.primary.color)
                )
        }
    }
}

struct LoadingView_Preview: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
