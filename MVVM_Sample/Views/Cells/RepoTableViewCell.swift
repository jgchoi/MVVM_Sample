//
//  RepoTableViewCell.swift
//  MVVM_Sample
//
//  Created by Jung Geon Choi on 2019-03-12.
//  Copyright © 2019 Jung Geon Choi. All rights reserved.
//
import UIKit

class RepoTableViewCell: UITableViewCell {

    public static let reuseIdentifier = "RepoCellID"

    @IBOutlet weak var repoNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var languageNameLabel: UILabel!
    @IBOutlet weak var starCountLabel: UILabel!

    public var viewModel: RepoTableViewCellModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            repoNameLabel.text = viewModel.name
            descriptionLabel.text = viewModel.desc
            languageNameLabel.text = viewModel.language
            starCountLabel.text = viewModel.starsCount
        }
    }
}
