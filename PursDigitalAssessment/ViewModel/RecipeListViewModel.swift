//
//  RecipeListViewModel.swift
//  PursDigitalAssessment
//
//  Created by Akhil Anand Sirra on 17/06/23.
//

import Foundation

@MainActor
final class RecipeListViewModel: ObservableObject {
    private let networkingLayer: GenericAPI = NetworkingLayer()
    
    @Published private(set) var recipesData = Recipes()
    @Published private(set) var errorMessage: String = ""
    @Published var hasError: Bool = false
    private let recipesURL = "https://hf-android-app.s3-eu-west-1.amazonaws.com/android-test/recipes.json"
    
    func fetchRecipeData() async {
        async let callReceipes: Void = fetchRecipes()
        let _ = await [callReceipes]
    }
    
    private func fetchRecipes() async {
        do {
            let recipes: Recipes = try await networkingLayer.request(recipesURL)
            recipesData = recipes
        } catch {
            errorMessage = error.localizedDescription
            hasError = true
            dump(error)
        }
    }
}
