//
//  PursDigitalAssessmentTests.swift
//  PursDigitalAssessmentTests
//
//  Created by Akhil Anand Sirra on 16/06/23.
//

import XCTest
@testable import PursDigitalAssessment

final class PursDigitalAssessmentTests: XCTestCase {
    private let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        return decoder
    }()
    
    private let networkingLayer: GenericAPI = NetworkingLayer()
    private let recipesURL = "https://hf-android-app.s3-eu-west-1.amazonaws.com/android-test/recipes.json"

    func testDecodingSampleRecipes() throws {
        _ = try decoder.decode(Recipes.self, from: Recipe.sampleJSON.data(using: .utf8)!)
    }
    
    func testRequestAndDecodeRecipesAPI() async throws {
        let _: Recipes = try await networkingLayer.request(recipesURL)
    }
}
