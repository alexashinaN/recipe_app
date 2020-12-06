//
//  FifthViewController.swift
//  MyTestProject
//
//  Created by Violence on 01.12.2020.
//  Copyright © 2020 Violence. All rights reserved.
//

import UIKit

class FifthViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

	let settingsImage = UIImageView(image: UIImage(named: "settings"))
	let tableView = UITableView(frame: .zero, style: .grouped)
	let cellId = "cellId"
	
	let recipies: [[RecipeModel]] = [
		[RecipeModel(productName: "Выбрать устройство", color: .darkGray)],
		[
			RecipeModel(productName: "Выбранный язык", recipeCountLabel: "Русский", color: .darkGray),
			RecipeModel(productName: "Размер карточки", recipeCountLabel: "Средняя", color: .darkGray),
			RecipeModel(productName: "Связаться с нами", recipeCountLabel: "redmond.company/ru/", color: .darkGray)
		]
	]

    override func viewDidLoad() {
        super.viewDidLoad()

		navigationItem.title = "НАСТРОЙКИ"
		view.backgroundColor = .black
		setupLayout()
		tableView.backgroundColor = .clear
		tableView.delegate = self
		tableView.dataSource = self
		tableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: cellId)
		tableView.rowHeight = 44
    }
	
	override var preferredStatusBarStyle : UIStatusBarStyle {
		return .lightContent 
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return recipies[section].count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! SettingsTableViewCell
		cell.menu = recipies[indexPath.section][indexPath.row]
		return cell
	}

	func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
		guard section == 0 else { return nil }
		return "Количество рецептов на разных устройствах может отличаться"
	}
	
	func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int){
		let footer = view as? UITableViewHeaderFooterView
		footer?.textLabel?.textColor = .white
	}
	
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		guard section == 0 else { return nil }
		return "Мультипекарь"
	}
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 2
	}
	

	
	func setupLayout() {
		view.addSubviews(tableView, settingsImage)
		NSLayoutConstraint.activate([
			tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
			tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
			tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
			tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
			
			settingsImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
			settingsImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			settingsImage.heightAnchor.constraint(equalToConstant: 70),
			settingsImage.widthAnchor.constraint(equalToConstant: 70)
		])
	}

}
