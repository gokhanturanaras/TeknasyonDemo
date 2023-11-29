//
//  MainTableViewCell.swift
//  TeknasyonDemo
//
//  Created by Gökhan Aras on 29.11.2023.
//

import UIKit
import SDWebImage

class MainTableViewCell: UITableViewCell {
    
    private let popularTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let popularDesc: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    private let contentImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 16
        return imageView
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        return label
    }()
    
    private let raitingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .right
        return label
    }()
    
    func configuration(data: Popular){
        if let imagePath = data.backdropPath {
            contentImage.sd_setImage(with: URL(string: imagePath.getImagePath()))
        }
        popularTitle.text = data.name
        popularDesc.text = data.overview
        raitingLabel.text = "\(data.voteAverage ?? 0)"
        dateLabel.text = data.firstAirDate?.getUIDate()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .background
        draw()
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension MainTableViewCell {
    private func draw(){
        contentView.addSubview(contentImage)
        contentView.addSubview(stackView)
        contentView.addSubview(popularTitle)
        contentView.addSubview(popularDesc)
        stackView.addArrangedSubview(dateLabel)
        stackView.addArrangedSubview(raitingLabel)
    }
    private func setupConstraint(){
        imageConstraint()
        titleConstraint()
        descConstraint()
        stackViewConstraint()
    }
    
    private func imageConstraint(){
        NSLayoutConstraint.activate([
            contentImage.heightAnchor.constraint(equalToConstant: 200),
            contentImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            contentImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            contentImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            contentImage.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -16),

        ])
    }
    private func titleConstraint(){
        NSLayoutConstraint.activate([
            popularTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            popularTitle.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 8),
            popularTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }
    
    private func descConstraint(){
        NSLayoutConstraint.activate([
            popularDesc.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            popularDesc.topAnchor.constraint(equalTo: popularTitle.bottomAnchor, constant: 3),
            popularDesc.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            popularDesc.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -32)
        ])
    }
    private func stackViewConstraint(){
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stackView.topAnchor.constraint(equalTo: contentImage.bottomAnchor, constant: 16)
        ])
    }
}
