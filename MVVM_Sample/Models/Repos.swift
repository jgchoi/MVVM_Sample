//
//  Repos.swift
//  MVVM_Sample
//
//  Created by Jung Geon Choi on 2019-03-12.
//  Copyright © 2019 Jung Geon Choi. All rights reserved.
//

import Foundation

struct Repos: Codable {
    let total_count: Int
    let items: [Repo]
}
