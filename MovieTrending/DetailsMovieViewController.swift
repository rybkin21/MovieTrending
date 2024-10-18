
import UIKit
import SnapKit
import SDWebImage

class DetailsMovieViewController: UIViewController {

    //View Model
    var viewModel: DetailsMovieViewModel

    init(viewModel: DetailsMovieViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Outlets

    private lazy var movieImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private lazy var movieTitle: UILabel = {
        let title = UILabel()
        title.textColor = .label
        title.textAlignment = .center
        title.numberOfLines = 0
        title.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return title
    }()

    private lazy var movieDescription: UILabel = {
        let description = UILabel()
        description.textColor = .secondaryLabel
        description.textAlignment = .center
        description.numberOfLines = 0
        description.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return description
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Setup

    private func setupHierarchy() {
        self.title = "Movie Details"
        view.backgroundColor = .systemBackground
        view.addSubviews(movieImage, movieTitle, movieDescription)
        movieTitle.text = viewModel.movieTitle
        movieDescription.text = viewModel.movieDescription
        movieImage.sd_setImage(with: viewModel.movieImage)
    }

    private func setupLayout() {

        movieImage.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.trailing.leading.equalToSuperview().inset(8)
            make.bottom.equalToSuperview().dividedBy(3)
        }

        movieTitle.snp.makeConstraints { make in
            make.top.equalTo(movieImage.snp.bottom).offset(20)
            make.trailing.leading.equalToSuperview().inset(8)
        }

        movieDescription.snp.makeConstraints { make in
            make.top.equalTo(movieTitle.snp.bottom).offset(20)
            make.trailing.leading.equalToSuperview().inset(8)
        }
    }

    // MARK: - Actions

}
