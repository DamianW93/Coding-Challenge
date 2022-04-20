//
//  AppModuleAssembly.swift
//  CodingChallenge
//
//  Created by Damian Włodarczyk on 20/04/2022.
//

import Swinject
import SwinjectAutoregistration

final class AppModuleAssembly: Assembly {
    func assemble(container: Container) {
        container.autoregister(WindowControllerProtocol.self, initializer: WindowController.init)
    }
}
