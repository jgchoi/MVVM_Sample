//
//  GitHubAPI.swift
//  MVVM_Sample
//
//  Created by Jung Geon Choi on 2019-03-12.
//  Copyright © 2019 Jung Geon Choi. All rights reserved.
//

import Foundation

public enum GitHubAPI {
    case repositories(language: String)
    case user(login: String)
}

extension GitHubAPI: EndpointType {
    public var baseURL: URL {
        return URL(string: "https://api.github.com")!
    }

    public var path: String {
        switch self {
        case .repositories(let language):
            return "/search/repositories?q=+language:\(language)&sort=stars&order=desc"
        case .user(let login):
            return "/users/\(login)"
        }
    }
}
