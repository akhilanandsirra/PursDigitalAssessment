//
//  RecipeListItem.swift
//  PursDigitalAssessment
//
//  Created by Akhil Anand Sirra on 17/06/23.
//

import SwiftUI

struct RecipeListItem: View {
    let recipe: Recipe
    @EnvironmentObject var favorites: Favorites
    
    var body: some View {
        LazyVStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 12) {
                AsyncImage(url: URL(string: recipe.thumb)!) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(width: 150, height: 150)
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                            .cornerRadius(4)
                    case .failure:
                        Image(systemName: "photo")
                            .font(.headline)
                            .foregroundColor(.gray)
                            .frame(width: 150, height: 150)
                    default:
                        Image(systemName: "questionmark")
                            .font(.headline)
                            .frame(width: 150, height: 150)
                    }
                }
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text(recipe.name)
                            .font(.headline)
                        if favorites.contains(recipe) {
                            Image(systemName: "heart.fill")
                                .imageScale(.small)
                                .foregroundColor(Color.red)
                        }
                    }
                    Text(recipe.headline)
                        .font(.caption)
                    HStack() {
                        Text(recipe.time)
                            .font(.caption2)
                            .foregroundStyle(Color(.systemGray))
                        Spacer()
                        Text("Difficulty: \(recipe.difficulty)")
                            .font(.caption2)
                            .foregroundStyle(Color(.systemGray))
                    }
                }
            }
        }
        .padding()
    }
}

struct RecipeListItem_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListItem(recipe: Recipe.sampleData[0])
            .environmentObject(Favorites())
    }
}
