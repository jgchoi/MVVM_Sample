//
//  UserViewModel.swift
//  MVVM_Sample
//
//  Created by Jung Geon Choi on 2019-03-12.
//  Copyright © 2019 Jung Geon Choi. All rights reserved.
//

import Foundation
import MVVM_Networking

class UserViewModel {
    private var user: User?

    func user(login: String, completion: (() -> Void)?) {
        Networking.performNetworkTask(endpoint: GitHubAPI.user(login: login), type: User.self) { [weak self] (response) in
            self?.user = response
            completion?()
        }
    }

    var imageURL: URL? {
        return URL(string: user?.avatar_url ?? "")
    }

    var username: String {
        return user?.login ?? ""
    }

    var name: String {
        return user?.name ?? ""
    }

    var bio: String {
        return user?.bio ?? ""
    }
}
