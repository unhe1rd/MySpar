//
//  SparAssembly.swift
//  MySpar
//
//  Created by Mike Ulanov on 02.02.2024.
//

import Foundation
import UIKit

final class SparAssembly {
    static func assembly(moduleOutput: SparModuleOutput? = nil) -> UIViewController {
        let presenter = SparPresenter()
        let viewController = SparViewController(output: presenter)

        presenter.view = viewController
        presenter.moduleOutput = moduleOutput

        return viewController
    }
    
    static func subassembly(moduleOutput: SparModuleOutput? = nil) -> UIViewController {
        let presenter = SparPresenter()
        let viewController = ContainerUIView(output: presenter)

        presenter.view = viewController
        presenter.moduleOutput = moduleOutput

        return viewController
    }
}
