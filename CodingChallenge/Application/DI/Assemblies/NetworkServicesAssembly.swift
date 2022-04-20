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
            .autoregister(JSONDecoder.self, initializer: JSONDecoder.init)
            .inObjectScope(.container)
        
        container
            .autoregister(NetworkServiceProtocol.self, initializer: NetworkService.init)
            .inObjectScope(.container)
    }
}
