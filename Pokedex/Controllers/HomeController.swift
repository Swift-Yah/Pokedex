//
//  HomeController.swift
//  Pokedex
//
//  Created by Rafael Ferreira on 6/25/17.
//  Copyright © 2017 Swift Yah. All rights reserved.
//

import UIKit

final class HomeController: UITableViewController {
}

// MARK: UITableViewDataSource conforms

extension HomeController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = indexPath.section == 0 ? "PokedexStatus" : "Pokedex"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)

        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 1
        default: return 0
        }
    }
}

// MARK: UITableViewDelegate conforms

extension HomeController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}
