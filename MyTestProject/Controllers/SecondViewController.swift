//
//  SecondViewController.swift
//  MyTestProject
//
//  Created by Violence on 01.12.2020.
//  Copyright © 2020 Violence. All rights reserved.
//

import UIKit

final class SecondViewController: UIViewController {
	// MARK: - Private
	
	private let tableView = UITableView()
	private let cellId = "cellId"
	private let recipies: [RecipeModel] = [
		RecipeModel(productName: "БУТЕРБРОДЫ", color: .darkGray, productImage: "1", recipeCountLabel: "8 РЕЦЕПТОВ"),
		RecipeModel(productName: "ВАФЛИ", color: .darkGray, productImage: "2", recipeCountLabel: "7 РЕЦЕПТОВ"),
		RecipeModel(productName: "ВТОРЫЕ БЛЮДА", color: .darkGray, productImage: "3", recipeCountLabel: "14 РЕЦЕПТОВ"),
		RecipeModel(productName: "ВЫПЕЧКА", color: .darkGray, productImage: "4", recipeCountLabel: "25 РЕЦЕПТОВ"),
		RecipeModel(productName: "ГРИЛЬ", color: .darkGray, productImage: "5", recipeCountLabel: "6 РЕЦЕПТОВ"),
		RecipeModel(productName: "ЗДОРОВОЕ ПИТАНИЕ", color: .darkGray, productImage: "6", recipeCountLabel: "14 РЕЦЕПТОВ"),
		RecipeModel(productName: "ОСНОВНЫЕ БЛЮДА", color: .darkGray, productImage: "7", recipeCountLabel: "1 РЕЦЕПТ"),
		RecipeModel(productName: "САЛАТЫ И ЗАКУСКИ", color: .darkGray, productImage: "8", recipeCountLabel: "3 РЕЦЕПТА"),
		RecipeModel(productName: "СЛАДКАЯ ВЫПЕЧКА", color: .darkGray, productImage: "9", recipeCountLabel: "14 РЕЦЕПТОВ")
	]
	
	// MARK: - Life cycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		navigationItem.title = "КАТЕГОРИИ"
		view.backgroundColor = .white
		setupLayout()
		tableView.dataSource = self
		tableView.register(RecipeTableViewCell.self, forCellReuseIdentifier: cellId)
	}
	
	// MARK: - Override
	
	override var preferredStatusBarStyle : UIStatusBarStyle {
		return .lightContent 
	}
}

// MARK: - Configure, Layout

private extension SecondViewController {
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

// MARK: - UITableViewDataSource

extension SecondViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return recipies.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! RecipeTableViewCell
		let currentLastItem = recipies[indexPath.row]
		cell.menu = currentLastItem
		return cell
	}
}
