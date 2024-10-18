//
//  Extension + UIView.swift
//  MovieTrending
//
//  Created by Ivan Rybkin on 16.10.2024.
//

import UIKit

extension UIView {

    func addSubviews(_ views: UIView...) {
        for view in views { addSubview(view) }
    }
}
