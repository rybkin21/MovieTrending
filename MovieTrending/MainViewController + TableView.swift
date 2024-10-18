//
//  MainViewController + TableView.swift
//  MovieTrending
//
//  Created by Ivan Rybkin on 10.10.2024.
//

import Foundation
import UIKit

extension MainViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfSections()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainMovieCell.identifier, for: indexPath) as? MainMovieCell else {
            return UITableViewCell()
        }

        let callViewModel = cellDataSource[indexPath.row]
        cell.setupCell(viewModel: callViewModel)
        cell.selectionStyle = .none
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        180
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movieId = cellDataSource[indexPath.row].id
        self.openDetail(movieId: movieId)
    }
}
