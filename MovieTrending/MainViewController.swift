
import UIKit

class MainViewController: UIViewController {

    // MARK: - Outlets

    private lazy var button: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Setup

    private func setupHierarchy() {
        view.backgroundColor = .systemMint
        self.title = "NAv Title"
        view.addSubview(button)
    }

    private func setupLayout() {

    }

    // MARK: - Actions

    @objc private func buttonPressed() {

    }
}
