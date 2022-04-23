//
//  ShiftModuleFactory.swift
//  CodingChallenge
//
//  Created by Damian Włodarczyk on 20/04/2022.
//

import UIKit
import SwiftUI

protocol ShiftModuleFactoryProtocol {
    func buildShiftsList() -> UIViewController
    func buildShiftDetails(shift: ShiftResponseModel) -> ShiftDetails<ShiftDetailsViewModel>
}

final class ShiftModuleFactory: DIFactory, ShiftModuleFactoryProtocol {
    func buildShiftsList() -> UIViewController {
        let viewModel = ShiftsViewModel(shiftRepository: resolver.resolve(ShiftRepositoryProtocol.self)!)
        let viewController = ShiftsView(viewModel: viewModel, shiftModuleFactory: self).asViewController()
        
        return viewController
    }
    
    func buildShiftDetails(shift: ShiftResponseModel) -> ShiftDetails<ShiftDetailsViewModel> {
        let viewModel = ShiftDetailsViewModel(shift: shift)
        let view = ShiftDetails(viewModel: viewModel)
        
        return view
    }
}
