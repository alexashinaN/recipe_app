//
//  ViewController.swift
//  MyTestProject
//
//  Created by Violence on 01.12.2020.
//  Copyright © 2020 Violence. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	let recipeCollectionView: UICollectionView = {
	let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
		layout.itemSize = CGSize(width: 230, height: 100)
		layout.scrollDirection = .horizontal
		
		
		let recipeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        recipeCollectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "recipeCell")
		return recipeCollectionView
	}()
	
	let lastSeenCollectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()
			layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
			layout.itemSize = CGSize(width: 230, height: 100)
			layout.scrollDirection = .horizontal
			
			let lastSeenCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
			lastSeenCollectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "lastSeenCell")
			return lastSeenCollectionView
		}()
	
	let recipies: [RecipeModel] = [
		RecipeModel(productName: "Тыквенные вафли", productImage: "waffles", color: UIColor.lightGray),
		RecipeModel(productName: "Слойки с грушей", productImage: "grusha", color: UIColor.brown),
		RecipeModel(productName: "Кабачковые оладьи", productImage: "kabachok", color: UIColor.darkGray),
		RecipeModel(productName: "Вафельные рожки для мороженого", productImage: "vafel", color: UIColor.systemGray2),
		RecipeModel(productName: "Протеиновый торт с ягодами", productImage: "tort", color: UIColor.gray)
	]
	
	let lastSeenRecipies: [RecipeModel] = [
		RecipeModel(productName: "Лимонный кекс с маком", productImage: "keks", color: UIColor.brown),
		RecipeModel(productName: "Сладкие сэндвичи с бананом", productImage: "banana", color: UIColor.lightGray),
		RecipeModel(productName: "Тыквенные вафли", productImage: "waffles", color: UIColor.darkGray),
		RecipeModel(productName: "Отбивные из куриного филе", productImage: "kura", color: UIColor.systemGray4),
		RecipeModel(productName: "Сэндвич с ветчиной и сыром", productImage: "sandvich", color: UIColor.systemGray)
	]
	
	
	let image = UIImageView(image: UIImage(named: "welcome"))
	let recipeLabel = UILabel()
	let lastSeenLabel = UILabel()

	override func viewDidLoad() {
		super.viewDidLoad()
		configure()
		setupLayout()
		
	}
	
	func configure() {
		navigationItem.title = "АКТУАЛЬНОЕ"
		
		view.backgroundColor = .white
		recipeCollectionView.backgroundColor = .white
		lastSeenCollectionView.backgroundColor = .white
		recipeLabel.text = "НОВЫЕ РЕЦЕПТЫ"
		lastSeenLabel.text = "ПОСЛЕДНИЕ ПРОСМОТРЕННЫЕ"
		
		
	}

	func setupLayout() {
		view.addSubviews(recipeCollectionView, image, lastSeenCollectionView, recipeLabel, lastSeenLabel)
		
		NSLayoutConstraint.activate([
			image.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			image.leftAnchor.constraint(equalTo: view.leftAnchor),
			image.rightAnchor.constraint(equalTo: view.rightAnchor),
			image.heightAnchor.constraint(equalToConstant: view.frame.size.height / 4),
			
			recipeCollectionView.topAnchor.constraint(equalTo: recipeLabel.bottomAnchor),
			recipeCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
			recipeCollectionView.heightAnchor.constraint(equalToConstant: 120),
			recipeCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
			
			lastSeenCollectionView.topAnchor.constraint(equalTo: lastSeenLabel.bottomAnchor),
			lastSeenCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
			lastSeenCollectionView.heightAnchor.constraint(equalToConstant: 120),
			lastSeenCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
			
			recipeLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 30),
			recipeLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5),
			
			lastSeenLabel.topAnchor.constraint(equalTo: recipeCollectionView.bottomAnchor, constant: 30),
			lastSeenLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5)
		])
		
		recipeCollectionView.dataSource = self
		lastSeenCollectionView.dataSource = self
		
	}
	
	//change color of status bar to white
	override var preferredStatusBarStyle : UIStatusBarStyle {
		return .lightContent 
	}
}

extension ViewController: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		switch collectionView {
		case recipeCollectionView:
			return recipies.count
		case lastSeenCollectionView:
			//UITableViewHeaderFooterView
			return lastSeenRecipies.count
		default:
			return 1
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		switch collectionView {
		case recipeCollectionView:
			if let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "recipeCell", for: indexPath) as? CollectionViewCell {
				itemCell.menu = recipies[indexPath.row]
				return itemCell
			}
		case lastSeenCollectionView:
			if let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "lastSeenCell", for: indexPath) as? CollectionViewCell {
				itemCell.menu = lastSeenRecipies[indexPath.row]
				return itemCell
			}
		default:
			return UICollectionViewCell()
		}
		return UICollectionViewCell()
	}
	
}

