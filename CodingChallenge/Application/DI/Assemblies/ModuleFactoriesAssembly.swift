//
//  ModuleFactoriesAssembly.swift
//  CodingChallenge
//
//  Created by Damian Włodarczyk on 20/04/2022.
//

import Swinject
import SwinjectAutoregistration

final class ModuleFactoriesAssembly: Assembly {
    func assemble(container: Container) {
        container
            .register(ShiftModuleFactoryProtocol.self, factory: ShiftModuleFactory.init)
            .inObjectScope(.container)
    }
}
