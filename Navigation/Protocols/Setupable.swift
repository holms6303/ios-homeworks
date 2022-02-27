//
//  Setupable.swift
//  Navigation
//
//  Created by Алексей Заметаев on 27.02.2022.
//

import Foundation

protocol ViewModelProtocol {}

protocol Setupable {
    func setup(with viewModel: ViewModelProtocol)
}
