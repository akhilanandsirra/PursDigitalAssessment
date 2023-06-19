//
//  Favorites.swift
//  PursDigitalAssessment
//
//  Created by Akhil Anand Sirra on 18/06/23.
//

import Foundation

final class Favorites: ObservableObject {
    private var recipes: Set<String>
    private let saveKey = "Favorites"
    
    init() {
        // load our saved data
        if let savedRecipes = UserDefaults.standard.array(forKey: saveKey) as? [String] {
            recipes = Set(savedRecipes)
        } else {
            recipes = []
        }
    }
    
    // returns true if our set contains this recipe
    func contains(_ recipe: Recipe) -> Bool {
        recipes.contains(recipe.id)
    }
    
    // adds the recipe to our set, updates all views, and saves the change
    func add(_ recipe: Recipe) {
        objectWillChange.send()
        recipes.insert(recipe.id)
        save()
    }
    
    // removes the recipe from our set, updates all views, and saves the change
    func remove(_ recipe: Recipe) {
        objectWillChange.send()
        recipes.remove(recipe.id)
        save()
    }
    
    func save() {
        UserDefaults.standard.set(Array(recipes), forKey: saveKey)
    }
}
