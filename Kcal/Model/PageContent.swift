//
//  PageContent.swift
//  Kcal
//
//  Created by Dana Sami Abu Eid on 18/03/2024.
//

import Foundation

struct PageContent {
    let imageName: String
    let labelTitle: String
    let labelText: String
}

// Example content
let pages: [PageContent] = [
    PageContent(imageName: "Eating-healthy-food-cuate", labelTitle:"Eat Healthy" ,labelText: "Maintaining good health should be the primary focus of everyone."),
    PageContent(imageName: "Cooking-cuate", labelTitle:"Healthy Recipes" , labelText: "Browse thousands of healthy recipes from all over the world."),
    PageContent(imageName: "Mobile-cuate", labelTitle:"Track Your Health" , labelText: "With amazing inbuilt tools you can track your progress.")
]
