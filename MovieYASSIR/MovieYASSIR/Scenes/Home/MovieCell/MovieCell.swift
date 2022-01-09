//
//  MovieCell.swift
//  MovieYASSIR
//
//  Created by Burak Kaya on 09.01.22.
//

import UIKit
import TinyConstraints
import Kingfisher

class MovieCell: UICollectionViewCell, ReusableView {
    
    weak var viewModel: MovieCellProtocol?
    
    private let containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.layer.borderWidth = 1
        view.backgroundColor = .white
        view.layer.borderColor = UIColor.lightGray.cgColor
        return view
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
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
        label.font = .systemFont(ofSize: 14, weight: .light)
        return label
    }()
    
    
    private lazy var infoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(releaseLabel)
        stackView.spacing = 10
        stackView.distribution = .fillProportionally
        stackView.axis = .vertical
        stackView.alignment = .leading
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureContents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureContents()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        titleLabel.text = nil
        releaseLabel.text = nil
        containerView.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    private func configureContents() {
        contentView.addSubview(containerView)
        containerView.edgesToSuperview(insets: .init(top: 0, left: 20, bottom: 0, right: 20))
        
        containerView.addSubview(imageView)
        imageView.edgesToSuperview(excluding: .trailing)
        imageView.aspectRatio(0.6)
        
        containerView.addSubview(infoStackView)
        infoStackView.edgesToSuperview(excluding: [.leading, .bottom], insets: .init(top: 5, left: 10, bottom: 5, right: 10))
        infoStackView.leadingToTrailing(of: imageView).constant = 10
    }
    
    func set(viewModel: MovieCellProtocol) {
        self.viewModel = viewModel
        if let posterPath = viewModel.movie.posterPath{
            let posterUrlString = "https://image.tmdb.org/t/p/w500" + posterPath
            imageView.kf.setImage(with: URL(string: posterUrlString))
        }
        titleLabel.text = viewModel.movie.originalTitle
        releaseLabel.text = viewModel.movie.releaseDate
    }
    
}
