//
//  BaseCellProtocol.swift
//  TestQuandooTask
//
//  Created by Gkol on 10/29/17.
//  Copyright © 2017 Gkol. All rights reserved.
//

import Foundation

/// ConfigurableCell - cell is configurated and can be registered in table view by GenericTableViewConfigurator.
protocol ConfigurableCell : class {
    
    /// Type of viewModel which is shown in the cell.
    associatedtype ItemType
    
    /// Cell indetifier for registering the cell in table view.
    ///
    /// - Returns: Indetifier string. Default is class name. Also the indetifier should be set in xib file of cell.
    static func cellId() -> String
    
    /// Nib name which is used for registering in tableView.
    ///
    /// - Returns: Nib name string. Default is class name.
    static func cellNibName() -> String
    
    /// Configurate cell with view model. Labels, image etc.
    ///
    /// - Parameter item: ViewModel
    func setup(with item: ItemType)
}

extension ConfigurableCell {
    static func cellId() -> String {
        return String(describing:self)
    }
    
    static func cellNibName() -> String {
        return String(describing:self)
    }
}
