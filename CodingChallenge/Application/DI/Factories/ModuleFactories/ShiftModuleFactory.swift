//
//  ShiftModuleFactory.swift
//  CodingChallenge
//
//  Created by Damian Włodarczyk on 20/04/2022.
//

import UIKit

protocol ShiftModuleFactoryProtocol {
    func buildShiftsList() -> UIViewController
}

final class ShiftModuleFactory: DIFactory, ShiftModuleFactoryProtocol {
    func buildShiftsList() -> UIViewController {
        let viewModel = ShiftsViewModel(shiftRepository: resolver.resolve(ShiftRepositoryProtocol.self)!)
        let viewController = ShiftsView(viewModel: viewModel).asViewController()
        
        return viewController
    }
}
