//
//  UsersAndPostsServiceManager.swift
//  TestQuandooTask
//
//  Created by Hrybeniuk Mykola on 10/30/17.
//  Copyright © 2017 Gkol. All rights reserved.
//

import Foundation

/// Path urls for UsersAndPosts Module
fileprivate struct ApiUrls {
    static let users = "/users"
    static let posts = "/posts"
}

// MARK: - Extends Service Manager for getting users list
extension ServiceManager : UsersLoaderManager {
    func loadUsersList(_ handler: @escaping (Bool, [UserModel]?, ErrorMessage?) -> ()) {
        doRequest(ApiUrls.users, nil, .get, handler: handler)
    }
}

// MARK: - Extends Service Manager for getting post list
extension ServiceManager : PostsLoaderManager {
    func loadPostsList(with userId: Int, _ handler: @escaping (Bool, [PostModel]?, ErrorMessage?) -> ()) {
        doRequest(ApiUrls.posts, ["userId" : String(userId)], .get, handler: handler)
    }
}
