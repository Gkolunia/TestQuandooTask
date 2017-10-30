//
//  GenericTableViewDataSource.swift
//  TestQuandooTask
//
//  Created by Gkol on 10/29/17.
//  Copyright © 2017 Gkol. All rights reserved.
//

import UIKit

/// Generic configurator for table view. Work with ConfigurableCell.
class GenericTableViewConfigurator<CellType: ConfigurableCell & UITableViewCell> : NSObject, UITableViewDataSource, UITableViewDelegate {
    
    /// Array of items for table view.
    var dataSource : [CellType.ItemType] {
        didSet {
            tableView?.reloadData()
        }
    }
    
    /// Callback is called when didselect event is invoked
    var selectionHandler: ((_ selectedItem: CellType.ItemType) -> ())?
    
    weak var tableView : UITableView?
    
    override init() {
        dataSource = []
        super.init()
    }
    
    /// Configurate table view. Register generic cell by using nib name. Set dataSource and delegate.
    ///
    /// - Parameter defaultTableView: TableView for configuration.
    func configurate(_ defaultTableView: UITableView) {
        tableView = defaultTableView
        tableView?.dataSource = self
        tableView?.delegate = self
        tableView?.register(UINib.init(nibName: CellType.cellNibName(), bundle: nil), forCellReuseIdentifier: CellType.cellId())
    }
    
    // UITableViewDataSource protocol
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cellBase = tableView.dequeueReusableCell(withIdentifier: CellType.cellId()) as? CellType{
            cellBase.setup(with: dataSource[indexPath.row])
            return cellBase
        }
        return UITableViewCell()
    }
    
    // UITableViewDelegate - protocol
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let selectionHandler = selectionHandler {
            selectionHandler(dataSource[indexPath.row])
        }
    }
    
}
