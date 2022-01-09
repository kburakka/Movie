//
//  MovieDetailViewController.swift
//  MovieYASSIR
//
//  Created by Burak Kaya on 09.01.22.
//

import UIKit
import TinyConstraints

final class MovieDetailViewController: BaseViewController<MovieDetailViewModel> {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private let containerView = UIView()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.numberOfLines = 0
        return label
    }()
    
    private let releaseLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    private let overviewLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var infoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(releaseLabel)
        stackView.addArrangedSubview(overviewLabel)
        stackView.spacing = 15
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.alignment = .center
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchMovieDetail { [weak self] movie in
            if let posterPath = movie.posterPath{
                let posterUrlString = "https://image.tmdb.org/t/p/w500" + posterPath
                self?.imageView.kf.setImage(with: URL(string: posterUrlString))
            }
            self?.titleLabel.text = movie.originalTitle
            self?.releaseLabel.text = movie.releaseDate
            self?.overviewLabel.text = movie.overview
            self?.infoStackView.layoutIfNeeded()
        }
    }
    
    override func setupViews() {
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(infoStackView)
    }
    
    override func setupLayouts() {
        scrollView.edgesToSuperview(usingSafeArea: true)
        containerView.edgesToSuperview()
        containerView.widthToSuperview()
        infoStackView.edgesToSuperview(insets: .init(top: 20, left: 20, bottom: 20, right: 20))
        imageView.width(120)
        imageView.height(280)
        titleLabel.widthToSuperview()
        releaseLabel.widthToSuperview()
        overviewLabel.widthToSuperview()
    }
}
