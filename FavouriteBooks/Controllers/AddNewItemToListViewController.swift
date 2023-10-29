//
//  AddNewItemToListViewController.swift
//  FavouriteBooks
//
//  Created by Tekla Matcharashvili on 29.10.23.
//

import UIKit

protocol AddNewItemDelegate: AnyObject {
    func didAddNewItem(_ item: FavoriteItem)
}

class AddNewItemToListViewController: UIViewController {
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    weak var delegate: AddNewItemDelegate?
    
    private let titleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter title"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupImagePicker()
    }
    
    private func setupUI() {
        backgroundImageView.image = UIImage(named: "background1")
        backgroundImageView.frame = view.bounds
        view.addSubview(backgroundImageView)
        
        view.addSubview(titleTextField)
        view.addSubview(imageView)
        
        titleTextField.frame = CGRect(x: 20, y: 100, width: view.frame.width - 40, height: 40)
        imageView.frame = CGRect(x: 20, y: 150, width: view.frame.width - 40, height: 200)
        
        let addButton = UIBarButtonItem(title: "Add", style: .done, target: self, action: #selector(addButtonTapped))
        navigationItem.rightBarButtonItem = addButton
        
        let pickImageButton = UIButton(type: .system)
        pickImageButton.backgroundColor = .white
        pickImageButton.layer.cornerRadius = 16
        pickImageButton.setTitleColor(UIColor.systemPink, for: .normal)
        pickImageButton.setTitle("Pick Image", for: .normal)
        pickImageButton.addTarget(self, action: #selector(pickImage), for: .touchUpInside)
        view.addSubview(pickImageButton)
        
        
        pickImageButton.frame = CGRect(x: 20, y: 350, width: view.frame.width - 40, height: 40)
    }
    
    private func setupImagePicker() {
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = false
    }
    
    @objc private func pickImage() {
        present(imagePicker, animated: true, completion: nil)
    }
    @objc private func addButtonTapped() {
        guard let title = titleTextField.text, !title.isEmpty, let image = imageView.image else {
            return
        }
        
        let newItem = FavoriteItem(image: image, title: title)
        delegate?.didAddNewItem(newItem)
        
        navigationController?.popViewController(animated: true)
    }
    
    
}

extension AddNewItemToListViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let pickedImage = info[.originalImage] as? UIImage {
            imageView.image = pickedImage
        }
        
        dismiss(animated: true, completion: nil)
    }
}

