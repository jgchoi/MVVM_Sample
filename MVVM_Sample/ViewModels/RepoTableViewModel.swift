//
//  ReposViewController.swift
//  MVVM_Sample
//
//  Created by Jung Geon Choi on 2019-03-12.
//  Copyright © 2019 Jung Geon Choi. All rights reserved.
//

import Foundation
import MVVM_Networking

class RepoTableViewModel {
    private let networking = Networking()
    private var repos: Repos?

	var count: Int {
		return repos?.items.count ?? 0
	}

    func getMostPopularRepos(language: String,
                             completion: (() -> Void)?) {
        networking.performNetworkTask(endpoint: GitHubAPI.repositories(language: language),
                                      type: Repos.self) { [weak self] (response) in
                                        self?.repos = response
                                        completion?()
        }
    }

    func cellViewModel(index: Int) -> RepoTableViewCellModel? {
        guard let repos = repos else { return nil }
        let repoTableViewCellModel = RepoTableViewCellModel(repo: repos.items[index])
        return repoTableViewCellModel
    }

    func selectedUserLogin(index: Int) -> String {
        return repos?.items[index].owner.login ?? ""
    }
}
