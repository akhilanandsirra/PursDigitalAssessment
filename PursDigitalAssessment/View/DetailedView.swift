//
//  DetailedView.swift
//  PursDigitalAssessment
//
//  Created by Akhil Anand Sirra on 17/06/23.
//

import SwiftUI

struct DetailedView: View {
    let recipe: Recipe
    let staticRecipe: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed at semper velit. Fusce euismod varius justo, ac sagittis risus interdum in. Nunc dapibus sem eu arcu imperdiet, vel euismod nisi suscipit. Ut scelerisque, massa eu consectetur faucibus, justo massa rhoncus ligula, vitae elementum lorem metus auctor justo. Maecenas posuere, lorem et pellentesque rhoncus, elit est ultrices nisl, eget auctor nisi lorem ut justo. Mauris ultrices purus sit amet risus vulputate, id vulputate erat ullamcorper. Sed auctor ipsum vel semper eleifend. In hac habitasse platea dictumst. Nulla interdum eros et nibh maximus, quis consectetur justo iaculis."
    
    @EnvironmentObject var favorites: Favorites
    
    var body: some View {
        ScrollView {
            VStack {
                Text(recipe.name)
                    .font(.title.weight(.bold))
                    .padding(.horizontal)
                    .multilineTextAlignment(.center)
                
                Text(recipe.headline)
                    .font(.title3.weight(.light))
                    .padding(.horizontal)
                    .multilineTextAlignment(.center)
                
                AsyncImage(url: URL(string: recipe.image)!) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(height: 200)
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                            .cornerRadius(4)
                            .padding()
                    case .failure:
                        Image(systemName: "photo")
                            .font(.headline)
                            .foregroundColor(.gray)
                            .frame(height: 200)
                    default:
                        Image(systemName: "questionmark")
                            .font(.headline)
                            .frame(height: 200)
                    }
                }
                
                Button(favorites.contains(recipe) ? "Remove from Favorites" : "Add to Favorites") {
                    if favorites.contains(recipe) {
                        favorites.remove(recipe)
                    } else {
                        favorites.add(recipe)
                    }
                }
                .buttonStyle(.borderedProminent)
                .cornerRadius(25)
                .font(.body.weight(.light))
                
                Text("Difficulty: \(recipe.difficulty)")
                    .font(.title3.weight(.light))
                    .padding()
                    .multilineTextAlignment(.center)
                
                VStack(alignment: .leading, spacing: 24) {
                    HStack(alignment: .center) {
                        Spacer()
                        TextRowView(title: "Calories", value: recipe.calories)
                        Spacer()
                        TextRowView(title: "Time", value: recipe.time)
                        Spacer()
                    }
                    HStack(alignment: .center) {
                        Spacer()
                        TextRowView(title: "Proteins", value: recipe.proteins)
                        Spacer()
                        TextRowView(title: "Fats", value: recipe.fats)
                        Spacer()
                        TextRowView(title: "Carbs", value: recipe.carbs)
                        Spacer()
                    }
                    
                    Text(recipe.description)
                        .padding(24)
                        .font(.body)
                        .multilineTextAlignment(.center)
                    
                    Text("Instructions:")
                        .font(.body.weight(.medium))
                        .padding(.horizontal, 24)
                    
                    Text(staticRecipe)
                        .font(.body.weight(.light))
                        .padding(.horizontal, 24)
                }
            }
        }
    }
}

struct TextRowView: View {
    let title: String
    let value: String
    
    var body: some View {
        VStack(spacing: 4) {
            Text(title)
                .font(.body.weight(.medium))
            Text(value)
                .font(.title3.weight(.thin))
        }
    }
}

struct DetailedView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedView(recipe: Recipe.sampleData[0])
            .environmentObject(Favorites())
    }
}
