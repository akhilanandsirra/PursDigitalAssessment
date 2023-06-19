//
//  FavoritesTests.swift
//  PursDigitalAssessmentTests
//
//  Created by Akhil Anand Sirra on 19/06/23.
//

import XCTest
@testable import PursDigitalAssessment

final class FavoritesTests: XCTestCase {
    
    var favorites: Favorites!
    
    override func setUp() {
        super.setUp()
        favorites = Favorites()
        // Clear any existing saved recipes
        UserDefaults.standard.removeObject(forKey: "Favorites")
    }
    
    override func tearDown() {
        favorites = nil
        super.tearDown()
    }
    
    func testAddRecipe() {
        let recipe = Recipe.sampleData[0]

        favorites.add(recipe)
        
        XCTAssertEqual(favorites.contains(recipe), true)
    }
    
    func testRemoveRecipe() {
        let recipe = Recipe.sampleData[0]
        
        favorites.add(recipe)
        favorites.remove(recipe)
        
        XCTAssertEqual(favorites.contains(recipe), false)
    }
    
    func testSave() {
        let recipe = Recipe.sampleData[0]
        
        favorites.add(recipe)
        favorites.save()
        
        // Verify that the recipe is saved
        let savedRecipes = UserDefaults.standard.array(forKey: "Favorites") as? [String]
        XCTAssertEqual(savedRecipes?.contains(recipe.id), true)
    }
    
}
