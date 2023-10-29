//
//  FavoriteItemCell.swift
//  FavouriteBooks
//
//  Created by Tekla Matcharashvili on 29.10.23.
//

import UIKit

struct FavoriteItem {
    let image: UIImage?
    let title: String
}

class FavoriteItemCell: UITableViewCell {
    
    private let itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let itemTitleView: UILabel = {
        let titleView = UILabel()
        titleView.contentMode = .left
        titleView.clipsToBounds = true
        return titleView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(itemTitleView)
        contentView.addSubview(itemImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with item: FavoriteItem) {
        itemImageView.image = item.image
        itemTitleView.text = item.title
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let imageSize = CGSize(width: contentView.frame.height - 20, height: contentView.frame.height - 20)
        let titleSize = itemTitleView.sizeThatFits(CGSize(width: contentView.frame.width - 40 - imageSize.width, height: contentView.frame.height))
        
        itemTitleView.frame = CGRect(x: 10, y: (contentView.frame.height - titleSize.height) / 2, width: titleSize.width, height: titleSize.height)
        
        itemImageView.frame = CGRect(x: itemTitleView.frame.maxX + 10, y: (contentView.frame.height - imageSize.height) / 2, width: imageSize.width, height: imageSize.height)
    }
}
