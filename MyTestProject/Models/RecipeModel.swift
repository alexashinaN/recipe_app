//
//  VCModel.swift
//  MyTestProject
//
//  Created by Violence on 01.12.2020.
//  Copyright © 2020 Violence. All rights reserved.
//

import UIKit

struct RecipeModel {
	let productName: String
	let color: UIColor
	let productImage: String?
	let recipeCountLabel: String?
	
	init(productName: String, color: UIColor, productImage: String? = nil, recipeCountLabel: String? = nil) {
		self.productName = productName
		self.color = color
		self.productImage = productImage
		self.recipeCountLabel = recipeCountLabel
	}
}
