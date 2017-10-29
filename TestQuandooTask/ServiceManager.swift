//
//  ServiceManager.swift
//  LesaraTestTask
//
//  Created by Hrybeniuk Mykola on 10/7/17.
//  Copyright © 2017 Hrybenuik Mykola. All rights reserved.
//

import Foundation
import UIKit

enum RequsetType: String {
    case get = "GET"
    case post = "POST"
}

typealias ErrorMessage = (title: String, description: String?)
typealias CompletionHandler<T> = (_ succes: Bool, _ object: [T]?,_ errorMessage: ErrorMessage?) -> ()

struct NetworkDomainErrors {
    static let noInternetConnection : ErrorMessage = ("No Internet Connection!", "Please connect to WiFi to see the latest data.")
    static let somethingGoesWrong : ErrorMessage = ("Something goes wrong.", nil)
}

struct ApiUrls {
    static let users = "/users"
    static let posts = "/posts"
}

struct ServiceConstants {
    static let host = "jsonplaceholder.typicode.com"
    static let scheme = "https"
}

class ServiceManager {

    /**
     * @brief Base method which construct url request with params and http body.
     */
    static func makeRequest<T: Codable>(_ urlString: String, _ httpParams: [String : String]? = nil, _ requestType: RequsetType, handler:@escaping CompletionHandler<T>) {

        let urlComponents = NSURLComponents()
        urlComponents.scheme = ServiceConstants.scheme
        urlComponents.host = ServiceConstants.host
        urlComponents.path = urlString
        
        if let params = httpParams, params.count > 0 {
            var queryItems = [URLQueryItem]()
            for key in params.keys {
                queryItems.append(URLQueryItem(name: key, value: params[key]))
            }
            urlComponents.queryItems = queryItems
        }
        
        if let url = urlComponents.url {
            let session = URLSession.shared
            let request = NSMutableURLRequest(url: url)
            request.httpMethod = requestType.rawValue
            request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData
            let task = session.dataTask(with: request as URLRequest) { (data, response, error) in
                
                guard let response: HTTPURLResponse = response as? HTTPURLResponse else {
                    if let error = error {
                        handler(false, nil, ("Network Error.", error.localizedDescription))
                    }
                    else {
                        handler(false, nil, NetworkDomainErrors.somethingGoesWrong)
                    }
                    return
                }
                
                switch response.statusCode {
                case 200...204:
                    if let dataResponse = data {
                        do {
                            let mappableObject = try JSONDecoder().decode([T].self, from: dataResponse)
                            DispatchQueue.main.async {
                                handler(true, mappableObject, nil)
                            }
                        } catch {
                            handler(false, nil, nil)
                        }
                    }
                    else {
                        DispatchQueue.main.async {
                            handler(true, nil, nil)
                        }
                    }
                default:
                    DispatchQueue.main.async {
                        if let error = error {
                            handler(false, nil, ("Server Error.", error.localizedDescription))
                        }
                        else {
                            handler(false, nil, ("Status Code "+String(response.statusCode), HTTPURLResponse.localizedString(forStatusCode: response.statusCode)))
                        }
                    }
                    
                }
                
            }
            task.resume()
        }
        
    }
    
}

extension ServiceManager : UsersLoaderManagerProtocol {
    
    func loadUsersList(_ handler: @escaping (Bool, [UserModel]?, ErrorMessage?) -> ()) {
        ServiceManager.makeRequest(ApiUrls.users, nil, .get, handler: handler)
    }

}
