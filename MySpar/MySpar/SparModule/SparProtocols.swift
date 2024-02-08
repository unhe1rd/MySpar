//
//  SparProtocols.swift
//  MySpar
//
//  Created by Mike Ulanov on 02.02.2024.
//

import Foundation


protocol SparModuleInput {
    var moduleOutput: SparModuleOutput? { get }
}

protocol SparModuleOutput: AnyObject {
}

protocol SparViewInput: AnyObject {
    func configure(with model: SparViewModel, with review: [ReviewCellModel])
}

protocol SparViewOutput: AnyObject {
    func didLoadView()
}
