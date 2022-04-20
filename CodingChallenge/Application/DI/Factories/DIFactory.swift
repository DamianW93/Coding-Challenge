//
//  DIFactory.swift
//  CodingChallenge
//
//  Created by Damian Włodarczyk on 20/04/2022.
//

import Swinject

class DIFactory {
    let resolver: Resolver

    init(resolver: Resolver) {
        self.resolver = resolver
    }
}
