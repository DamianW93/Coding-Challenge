//
//  Assembler.swift
//  CodingChallenge
//
//  Created by Damian Włodarczyk on 20/04/2022.
//

import Swinject

extension Assembler {
    static func appAssembler() -> Assembler {
        Assembler([
            AppModuleAssembly(),
            NetworkServicesAssembly(),
            RepositoriesAssembly(),
            ModuleFactoriesAssembly()
        ])
    }
}
