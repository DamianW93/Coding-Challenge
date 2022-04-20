//
//  RepositoriesAssembly.swift
//  CodingChallenge
//
//  Created by Damian Włodarczyk on 20/04/2022.
//

import Swinject
import SwinjectAutoregistration

final class RepositoriesAssembly: Assembly {
    func assemble(container: Container) {
        container
            .autoregister(ShiftRepositoryProtocol.self, initializer: ShiftRepository.init)
            .inObjectScope(.container)
    }
}
