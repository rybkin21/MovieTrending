//
//  MainMovieCell.swift
//  MovieTrending
//
//  Created by Ivan Rybkin on 12.10.2024.
//

import UIKit
import SnapKit
import SDWebImage

class MainMovieCell: UITableViewCell {

    public static var identifier: String {
        get {
            return "MainMovieCell"
        }
    }

    // MARK: - Outlets

    private lazy var backView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray.withAlphaComponent(0.1)
        view.layer.borderColor = UIColor.label.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 5
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private lazy var title: UILabel = {
        let title = UILabel()
        title.textColor = .black
        title.numberOfLines = 0
        title.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return title
    }()

    private lazy var dateLabel: UILabel = {
        let date = UILabel()
        date.textColor = .systemGray
        date.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return date
    }()

    private lazy var rateLabel: UILabel = {
        let grade = UILabel()
        grade.textColor = .systemYellow
        grade.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return grade
    }()

    // MARK: - Initializers

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    func setupHierarchy() {
        self.addSubview(backView)
        backView.addSubview(image)
        backView.addSubview(title)
        backView.addSubview(dateLabel)
        backView.addSubview(rateLabel)
    }

    func setupLayout() {

        backView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(16)
            make.leading.trailing.equalToSuperview().inset(8)
        }

        image.snp.makeConstraints { make in
            make.leading.equalTo(backView.snp.leading).inset(8)
            make.top.equalTo(backView.snp.top).inset(5)
            make.bottom.equalTo(backView.snp.bottom).offset(-5)
            make.width.equalTo(90)
        }

        title.snp.makeConstraints { make in
            make.top.equalTo(image.snp.top)
            make.leading.equalTo(image.snp.trailing).offset(8)
            make.trailing.equalTo(backView.snp.trailing)
        }

        rateLabel.snp.makeConstraints { make in
            make.bottom.equalTo(image.snp.bottom)
            make.leading.equalTo(image.snp.trailing).offset(8)
            make.trailing.equalTo(backView.snp.trailing)
        }

        dateLabel.snp.makeConstraints { make in
            make.bottom.equalTo(rateLabel.snp.top).inset(-5)
            make.leading.equalTo(image.snp.trailing).offset(8)
            make.trailing.equalTo(backView.snp.trailing)
        }
    }

    func setupCell(viewModel: MovieTableCellViewModel) {
        self.title.text = viewModel.title
        self.dateLabel.text = viewModel.date
        self.rateLabel.text = viewModel.rating
        self.image.sd_setImage(with: viewModel.imageUrl)
    }
}
