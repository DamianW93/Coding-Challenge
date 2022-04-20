//
//  WindowController.swift
//  CodingChallenge
//
//  Created by Damian Włodarczyk on 20/04/2022.
//

import UIKit

protocol WindowControllerProtocol {
    func setupWindow(_ window: UIWindow?)
}

final class WindowController: WindowControllerProtocol {
    private let shiftsModuleFactory: ShiftModuleFactoryProtocol
    private var window: UIWindow?
    
    init(shiftsModuleFactory: ShiftModuleFactoryProtocol) {
        self.shiftsModuleFactory = shiftsModuleFactory
    }
    
    func setupWindow(_ window: UIWindow?) {
        self.window = window
        
        window?.rootViewController = shiftsModuleFactory.buildShiftsList()
        window?.makeKeyAndVisible()
    }
}
