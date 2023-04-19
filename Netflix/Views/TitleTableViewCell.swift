//
//  TitleTableViewCell.swift
//  Netflix
//
//  Created by Thiago Pereira on 11/04/23.
//

import UIKit

class TitleTableViewCell: UITableViewCell {
    static let identifier = "TitleTableViewCell"
//    private var titles: [Title] = [Title]()
    
    
    private let playTitleButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "play.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        return button
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    private let titlePostUIImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titlePostUIImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(playTitleButton)
        
        applyConstraints()
    }
    
    private func applyConstraints() {
        let titlePostUIImageViewConstraint = [
            titlePostUIImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titlePostUIImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titlePostUIImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            titlePostUIImageView.widthAnchor.constraint(equalToConstant: 100)
        ]
        
        let titleLabelConstraint = [
            titleLabel.leadingAnchor.constraint(equalTo: titlePostUIImageView.trailingAnchor, constant: 20),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: playTitleButton.leadingAnchor, constant: -5)
        ]
        
        let playTitleButtonConstraint = [
            playTitleButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            playTitleButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            playTitleButton.widthAnchor.constraint(equalToConstant: 35)
        ]
        
        NSLayoutConstraint.activate(titlePostUIImageViewConstraint)
        NSLayoutConstraint.activate(titleLabelConstraint)
        NSLayoutConstraint.activate(playTitleButtonConstraint)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titlePostUIImageView.frame = bounds
    }
    
    public func configure(with model: TitleViewModel) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.posterURL)") else {return}
        titlePostUIImageView.sd_setImage(with: url)
        titleLabel.text = model.titleName
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
