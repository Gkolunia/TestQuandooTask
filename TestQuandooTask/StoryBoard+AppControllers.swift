//
//  StoryBoard.swift
//  RecipesTestTask
//
//  Created by Hrybeniuk Mykola on 10/29/17.
//  Copyright © 2017 Hrybenuik Mykola. All rights reserved.
//

import UIKit

fileprivate struct StoryBoard {
    static let kUsersListControllerId = "UsersListControllerID"
    static let kPostsListControllerId = "PostsListControllerID"
}

// MARK: - Default controllers of application in main story board. Just for convenience usage.
extension UIStoryboard {

    class func main() -> UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
    
    class func usersListController() -> UsersListController {
        return main().instantiateViewController(withIdentifier: StoryBoard.kUsersListControllerId) as! UsersListController
    }
    
    class func postsListController() -> PostsListController {
        return main().instantiateViewController(withIdentifier: StoryBoard.kPostsListControllerId) as! PostsListController
    }
    
}
