//
//  NetworkServicesAssembly.swift
//  CodingChallenge
//
//  Created by Damian Włodarczyk on 20/04/2022.
//

import Swinject
import SwinjectAutoregistration

final class NetworkServicesAssembly: Assembly {
    func assemble(container: Container) {
        container
            .register(URLSession.self) { _ in URLSession.shared }
            .inObjectScope(.container)
        
        container
            .register(JSONDecoder.self) { _ in JSONCoder.decoder }
            .inObjectScope(.container)
        
        container
            .autoregister(NetworkServiceProtocol.self, initializer: NetworkService.init)
            .inObjectScope(.container)
    }
}
