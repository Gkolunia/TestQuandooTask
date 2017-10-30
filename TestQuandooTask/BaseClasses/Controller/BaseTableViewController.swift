//
//  BaseTableViewController.swift
//  TestQuandooTask
//
//  Created by Gkol on 10/29/17.
//  Copyright © 2017 Gkol. All rights reserved.
//

import UIKit

/// Protocol of controller which can show loading view.
protocol LoadingController : class {
    func startLoading()
    func stopLoading()
}

/// Base table controller. Is ancestor for all list controllers in the app. Can make blur effect of view on loading a list.
class BaseTableViewController: UIViewController, LoadingController {
    
	@IBOutlet weak var tableView : UITableView!
    weak var loadingView : UIVisualEffectView!
    
    func startLoading() {
        let effectView = UIVisualEffectView(frame: view.frame)
        effectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        effectView.effect = UIBlurEffect(style: .dark)
        view.addSubview(effectView)
        loadingView = effectView
    }
    
    func stopLoading() {
        loadingView.removeFromSuperview()
    }
    
}
