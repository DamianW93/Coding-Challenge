//
//  ShiftModuleFactoryMock.swift
//  CodingChallenge
//
//  Created by Damian Włodarczyk on 23/04/2022.
//

import UIKit

final class SHiftModuleFactoryMock: ShiftModuleFactoryProtocol {
    func buildShiftsList() -> UIViewController {
        UIViewController()
    }
    
    func buildShiftDetails(shift: ShiftModel) -> ShiftDetails<ShiftDetailsViewModel> {
        fatalError("Not implemented")
    }
}
