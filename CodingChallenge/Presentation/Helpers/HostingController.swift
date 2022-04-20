//
//  HostingController.swift
//  CodingChallenge
//
//  Created by Damian Włodarczyk on 20/04/2022.
//

import SwiftUI

final class HostingController<Content>: UIHostingController<Content> where Content: View {
    override var preferredStatusBarStyle: UIStatusBarStyle { statusBarStyle }

    private let statusBarStyle: UIStatusBarStyle

    init(rootView: Content, statusBarStyle: UIStatusBarStyle = .default) {
        self.statusBarStyle = statusBarStyle

        super.init(rootView: rootView)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
