//
//  RepoTableViewCellModel.swift
//  MVVM_Sample
//
//  Created by Jung Geon Choi on 2019-03-12.
//  Copyright © 2019 Jung Geon Choi. All rights reserved.
//

import Foundation

class RepoTableViewCellModel {
    private let repo: Repo

    init(repo: Repo) {
        self.repo = repo
    }

    var name: String {
        return repo.name
    }

    var ownerName: String {
        return repo.owner.login
    }

    var desc: String {
        return repo.description
    }

    var starsCount: String {
        return "\(repo.stargazers_count)"
    }

    var language: String {
        return repo.language
    }
}
