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
        // TODO: Add ViewModel
        let viewController = ShiftsView().asViewController()
        
        return viewController
    }
}
