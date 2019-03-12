//
//  ReposViewController.swift
//  MVVM_Sample
//
//  Created by Jung Geon Choi on 2019-03-12.
//  Copyright © 2019 Jung Geon Choi. All rights reserved.
//

import UIKit

class ReposTableViewController: UITableViewController {
	private let viewModel = ReposTableViewModel()

	override func viewDidLoad() {
		super.viewDidLoad()
		viewModel.getMostPopularRepos(language: "Swift") { [weak self] in
			DispatchQueue.main.async {
				self?.tableView.reloadData()
			}
		}
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return viewModel.numberOfRows
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: RepoTableViewCell.reuseIdentifier,
													   for: indexPath) as? RepoTableViewCell else {
														return UITableViewCell()
		}

		let cellViewModel = viewModel.cellViewModel(index: indexPath.row)
		cell.viewModel = cellViewModel

		return cell
	}

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let destionationViewController = segue.destination as? UserViewController,
			let selectionIndexPath = tableView.indexPathForSelectedRow {
			let userLogin = viewModel.selectedUserLogin(index: selectionIndexPath.row)
			destionationViewController.userLogin = userLogin
		}
	}
}
