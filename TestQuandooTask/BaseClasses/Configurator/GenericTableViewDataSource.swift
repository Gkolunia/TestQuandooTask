//
//  GenericTableViewDataSource.swift
//  TestQuandooTask
//
//  Created by Gkol on 10/29/17.
//  Copyright © 2017 Gkol. All rights reserved.
//

import UIKit

class GenericTableViewDataSource<CellType: BaseCellProtocol & UITableViewCell> : NSObject, UITableViewDataSource {
    
    let dataSource : [CellType.ItemType]
    
    init(defaultDataSource: [CellType.ItemType]) {
        dataSource = defaultDataSource
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
    
}
