//
//  User.swift
//  MVVM_Sample
//
//  Created by Jung Geon Choi on 2019-03-12.
//  Copyright © 2019 Jung Geon Choi. All rights reserved.
//

import Foundation

struct User: Codable {
    let login: String
    let url: String
    let name: String?
    let avatar_url: String?
    let bio: String?
}
