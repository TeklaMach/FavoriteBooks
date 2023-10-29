//
//  ItemDetailsViewController.swift
//  FavouriteBooks
//
//  Created by Tekla Matcharashvili on 29.10.23.
//

import UIKit

class ItemDetailsViewController: UIViewController {
    
    private let favoriteItem: FavoriteItem
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    init(favoriteItem: FavoriteItem) {
        self.favoriteItem = favoriteItem
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        configure(with: favoriteItem)
    }
    
    private func setupUI() {
        backgroundImageView.image = UIImage(named: "background1")
        backgroundImageView.frame = view.bounds
        view.addSubview(backgroundImageView)
        
        view.addSubview(imageView)
        view.addSubview(titleLabel)
        
        imageView.frame = CGRect(x: 20, y: 100, width: view.frame.width - 40, height: 200)
        titleLabel.frame = CGRect(x: 20, y: 320, width: view.frame.width - 40, height: 40)
    }
    
    private func configure(with item: FavoriteItem) {
        imageView.image = item.image
        titleLabel.text = item.title
    }
}




