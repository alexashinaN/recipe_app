//
//  ThirdViewController.swift
//  MyTestProject
//
//  Created by Violence on 01.12.2020.
//  Copyright © 2020 Violence. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
	
	let cartImage = UIImageView(image: UIImage(named: "cart"))
	let label = UILabel()

	override func viewDidLoad() {
		super.viewDidLoad()
		
		navigationItem.title = "СПИСОК ПОКУПОК"
		view.backgroundColor = .white
		configure()
		setupLayout()
    }
    
	override var preferredStatusBarStyle : UIStatusBarStyle {
		return .lightContent //.default for black style
	}
	
	func configure() {
		label.text = "Ваша корзина пока пуста. Добавьте сюда необходимые продукты."
		label.textColor = .gray
		label.numberOfLines = 0
		label.textAlignment = .center
		label.lineBreakMode = .byWordWrapping
		label.font = .systemFont(ofSize: 14)
	}
	
	func setupLayout() {
		view.addSubviews(cartImage, label)
		
		NSLayoutConstraint.activate([
			cartImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			cartImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
			cartImage.widthAnchor.constraint(equalToConstant: 70),
			cartImage.heightAnchor.constraint(equalToConstant: 70),
			
			label.topAnchor.constraint(equalTo: cartImage.bottomAnchor, constant: 10),
			view.rightAnchor.constraint(equalTo: label.rightAnchor, constant: 20),
			label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20)
		])
	}
}
