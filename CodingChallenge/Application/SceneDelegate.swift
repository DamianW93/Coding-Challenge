//
//  SceneDelegate.swift
//  CodingChallenge
//
//  Created by Damian Włodarczyk on 20/04/2022.
//

import UIKit
import Swinject

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    private let windowController: WindowControllerProtocol
    private let appAssembler = Assembler.appAssembler()
    
    override init() {
        windowController = appAssembler.resolver.resolve(WindowControllerProtocol.self)!

        super.init()
    }

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = scene as? UIWindowScene else { return }

        window = UIWindow(windowScene: windowScene)
        windowController.setupWindow(window)
    }
}
