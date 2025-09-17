//
//  MovieDetailsViewController.swift
//  Cinetopia
//
//  Created by Victor Vaz de Oliveira on 17/09/25.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    var movie: Movie
    
    private lazy var moviePlayerImage: UIImageView = {
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = .moviePlayer
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    private lazy var movieTitle: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .white
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var movieImagePoster: UIImageView = {
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 12
        imageView.layer.masksToBounds = true
        
        return imageView
    }()
    
    private lazy var descriptionSectionLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Descrição:"
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .white
        
        return label
    }()
    
    private lazy var descriptionContentLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14)
        label.textColor = .white.withAlphaComponent(0.75)
        label.numberOfLines = 0
        
        return label
    }()
    
    init(movie: Movie) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .background
        
        movieTitle.text = movie.title
        movieImagePoster.image = UIImage(named: movie.image)
        descriptionContentLabel.text = movie.synopsis
        
        addSubviews()
        setupConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(moviePlayerImage)
        view.addSubview(movieTitle)
        view.addSubview(movieImagePoster)
        view.addSubview(descriptionSectionLabel)
        view.addSubview(descriptionContentLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            moviePlayerImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            moviePlayerImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            movieTitle.topAnchor.constraint(equalTo: moviePlayerImage.bottomAnchor, constant: 32),
            movieTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            movieImagePoster.topAnchor.constraint(equalTo: movieTitle.bottomAnchor, constant: 32),
            movieImagePoster.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            movieImagePoster.widthAnchor.constraint(equalToConstant: 192.0),
            movieImagePoster.heightAnchor.constraint(equalToConstant: 264.0),
            // TODO: Verify constants.
            
            descriptionSectionLabel.topAnchor.constraint(equalTo: movieImagePoster.bottomAnchor, constant: 32),
            descriptionSectionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            descriptionSectionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            descriptionContentLabel.topAnchor.constraint(equalTo: descriptionSectionLabel.bottomAnchor, constant: 16),
            descriptionContentLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            descriptionContentLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
        ])
    }
}

//#Preview {
//    MovieDetailsViewController(movie: movies[0])
//}
