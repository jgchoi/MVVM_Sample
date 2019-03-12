//
//  UserViewController.swift
//  MVVM_Sample
//
//  Created by Jung Geon Choi on 2019-03-12.
//  Copyright © 2019 Jung Geon Choi. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    
    private let viewModel = UserViewModel()

    public var userLogin: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let login = userLogin else { return }
        viewModel.user(login: login) { [weak self] in
            if let url = self?.viewModel.imageURL {
                do {
                    let data = try Data(contentsOf: url)
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        self?.imageView.image = image
                    }
                } catch _ { }
            }
            DispatchQueue.main.async {
                self?.nameLabel.text = self?.viewModel.name
                self?.loginLabel.text = self?.viewModel.username
                self?.bioLabel.text = self?.viewModel.bio
            }
        }
    }
}
