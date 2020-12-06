//
//  SecondViewController.swift
//  MyTestProject
//
//  Created by Violence on 01.12.2020.
//  Copyright © 2020 Violence. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
	
	
	let tableView = UITableView()
	let cellId = "cellId"
	let recipies: [RecipeModel] = [
		RecipeModel(productName: "БУТЕРБРОДЫ", productImage: "1", recipeCountLabel: "8 РЕЦЕПТОВ", color: UIColor.darkGray),
		RecipeModel(productName: "ВАФЛИ", productImage: "2", recipeCountLabel: "7 РЕЦЕПТОВ", color: UIColor.darkGray),
		RecipeModel(productName: "ВТОРЫЕ БЛЮДА", productImage: "3", recipeCountLabel: "14 РЕЦЕПТОВ", color: UIColor.darkGray),
		RecipeModel(productName: "ВЫПЕЧКА", productImage: "4", recipeCountLabel: "25 РЕЦЕПТОВ", color: UIColor.darkGray),
		RecipeModel(productName: "ГРИЛЬ", productImage: "5", recipeCountLabel: "6 РЕЦЕПТОВ", color: UIColor.darkGray),
		RecipeModel(productName: "ЗДОРОВОЕ ПИТАНИЕ", productImage: "6", recipeCountLabel: "14 РЕЦЕПТОВ", color: UIColor.darkGray),
		RecipeModel(productName: "ОСНОВНЫЕ БЛЮДА", productImage: "7", recipeCountLabel: "1 РЕЦЕПТ", color: UIColor.darkGray),
		RecipeModel(productName: "САЛАТЫ И ЗАКУСКИ", productImage: "8", recipeCountLabel: "3 РЕЦЕПТА", color: UIColor.darkGray),
		RecipeModel(productName: "СЛАДКАЯ ВЫПЕЧКА", productImage: "9", recipeCountLabel: "14 РЕЦЕПТОВ", color: UIColor.darkGray)
	]
	
	override func viewDidLoad() {
		super.viewDidLoad()
		navigationItem.title = "КАТЕГОРИИ"
		view.backgroundColor = .white
		setupLayout()
		tableView.delegate = self
		tableView.dataSource = self
		tableView.register(RecipeTableViewCell.self, forCellReuseIdentifier: cellId)
	}
	
	override var preferredStatusBarStyle : UIStatusBarStyle {
		return .lightContent 
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return recipies.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! RecipeTableViewCell
		let currentLastItem = recipies[indexPath.row]
		cell.menu = currentLastItem
		return cell
	}
	
	func setupLayout() {
		view.addSubviews(tableView)
		NSLayoutConstraint.activate([
			tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
			tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
			tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
		])
	}
}
