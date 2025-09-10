//
//  MovieTableViewCell.swift
//  Cinetopia
//
//  Created by Victor Vaz de Oliveira on 10/09/25.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    private lazy var moviePosterImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage.avatar)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 12
        
        return imageView
    }()
    
    private lazy var movieTitleLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Avatar"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
        
        return label
    }()
    
    private lazy var movieReleaseDateLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Lançamento: 18/12/2009"
        label.font = .systemFont(ofSize: 18)
        label.textColor = .white.withAlphaComponent(0.75)
        
        return label
    }()
    
    private func addSubviews() {
        addSubview(moviePosterImageView)
        addSubview(movieTitleLabel)
        addSubview(movieReleaseDateLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            moviePosterImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            moviePosterImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            moviePosterImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            moviePosterImageView.widthAnchor.constraint(equalToConstant: 100),
            
            movieTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            movieTitleLabel.leadingAnchor.constraint(equalTo: moviePosterImageView.trailingAnchor, constant: 16),
            
            movieReleaseDateLabel.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor, constant: 8),
            movieReleaseDateLabel.leadingAnchor.constraint(equalTo: moviePosterImageView.trailingAnchor, constant: 16),
        ])
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setupConstraints()
        backgroundColor = .background
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

#Preview {
    MovieTableViewCell()
}
