//
//  View+Extension.swift
//  CodingChallenge
//
//  Created by Damian Włodarczyk on 20/04/2022.
//

import SwiftUI

extension View {
    func asViewController(statusBarStyle: UIStatusBarStyle = .default) -> UIViewController {
        HostingController(rootView: self, statusBarStyle: statusBarStyle)
    }
}
