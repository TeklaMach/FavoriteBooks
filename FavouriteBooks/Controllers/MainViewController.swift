//
//  MainViewController.swift
//  FavouriteBooks
//
//  Created by Tekla Matcharashvili on 29.10.23.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddNewItemDelegate  {
    
    var favorites: [FavoriteItem] = []
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .systemTeal
        tableView.register(FavoriteItemCell.self, forCellReuseIdentifier: "FavoriteItemCell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupTableView()
        
        favorites.append(FavoriteItem(image: UIImage(named: "book1"), title: "Harry Potter"))
        favorites.append(FavoriteItem(image: UIImage(named: "book2"), title: "The Lord of the Rings"))
        favorites.append(FavoriteItem(image: UIImage(named: "book3"), title: "The Great Gatsby"))
        favorites.append(FavoriteItem(image: UIImage(named: "book4"), title: "Forrest Gump"))
        favorites.append(FavoriteItem(image: UIImage(named: "book5"), title: "The Princess Bride"))
        favorites.append(FavoriteItem(image: UIImage(named: "book6"), title: "The Green Mile"))
        favorites.append(FavoriteItem(image: UIImage(named: "book7"), title: "Coraline"))
        favorites.append(FavoriteItem(image: UIImage(named: "book8"), title: "The Book Thief"))
        favorites.append(FavoriteItem(image: UIImage(named: "book9"), title: "Normal People"))
        favorites.append(FavoriteItem(image: UIImage(named: "book10"), title: "Looking for Alaska"))
        tableView.reloadData()
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Favorites"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
    }
    
    @objc private func addButtonTapped() {
        let addNewItemVC = AddNewItemToListViewController()
        addNewItemVC.delegate = self
        navigationController?.pushViewController(addNewItemVC, animated: true)
    }
    func didAddNewItem(_ item: FavoriteItem) {
        print("Did add new item:", item)
        favorites.append(item)
        tableView.reloadData()
        navigationController?.popViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteItemCell", for: indexPath) as! FavoriteItemCell
        cell.configure(with: favorites[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let itemDetailsVC = ItemDetailsViewController(favoriteItem: favorites[indexPath.row])
        navigationController?.pushViewController(itemDetailsVC, animated: true)
    }
    
}


