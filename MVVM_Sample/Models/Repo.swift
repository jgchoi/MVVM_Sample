//
//  Repo.swift
//  MVVM_Sample
//
//  Created by Jung Geon Choi on 2019-03-12.
//  Copyright © 2019 Jung Geon Choi. All rights reserved.
//

import Foundation

struct Repo: Codable {
    let name: String
    let description: String
    let owner: User
    let language: String
    let stargazers_count: Int
}
