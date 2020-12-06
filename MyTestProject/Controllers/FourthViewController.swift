//
//  FourthViewController.swift
//  MyTestProject
//
//  Created by Violence on 01.12.2020.
//  Copyright © 2020 Violence. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {

	let favImage = UIImageView(image: UIImage(named: "heart"))
	let label = UILabel()
	
     	override func viewDidLoad() {
			super.viewDidLoad()
			
			navigationItem.title = "ЛЮБИМЫЕ РЕЦЕПТЫ"
			view.backgroundColor = .white
			configure()
			setupLayout()
		}
		
		override var preferredStatusBarStyle : UIStatusBarStyle {
			return .lightContent //.default for black style
		}
		
		func configure() {
			label.text = "Мы заметили, что Вы часто готовите одни и те же блюда. Пора добавить свою любимую еду в раздел!"
			label.textColor = .gray
			label.numberOfLines = 0
			label.textAlignment = .center
			label.lineBreakMode = .byWordWrapping
			label.font = .systemFont(ofSize: 14)
		}
		
		func setupLayout() {
			view.addSubviews(favImage, label)
			
			NSLayoutConstraint.activate([
				favImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
				favImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
				favImage.widthAnchor.constraint(equalToConstant: 70),
				favImage.heightAnchor.constraint(equalToConstant: 70),
				
				label.topAnchor.constraint(equalTo: favImage.bottomAnchor, constant: 10),
				view.rightAnchor.constraint(equalTo: label.rightAnchor, constant: 20),
				label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20)
			])
		}
}
