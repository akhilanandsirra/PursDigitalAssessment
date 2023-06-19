//
//  RecipeListView.swift
//  PursDigitalAssessment
//
//  Created by Akhil Anand Sirra on 17/06/23.
//

import SwiftUI

struct RecipeListView: View {
    @StateObject private var viewModel = RecipeListViewModel()
    @State var showFavoritesOnly = false
    
    @EnvironmentObject var favorites: Favorites
    
    var body: some View {
        List {
            Toggle(isOn: $showFavoritesOnly) {
                Text("Favorites Only")
                    .font(.subheadline)
            }
            .listRowBackground(Color.clear)
            .listRowSeparator(.hidden)

            
            ForEach(viewModel.recipesData, id: \.id) { recipe in
                if !self.showFavoritesOnly || favorites.contains(recipe) {
                    NavigationLink(destination: DetailedView(recipe: recipe)) {
                        RecipeListItem(recipe: recipe)
                    }
                    .listRowSeparator(.hidden)
                    .listRowBackground(
                        RoundedRectangle(cornerRadius: 10)
                            .background(.clear)
                            .foregroundColor(Color(.systemBackground))
                        
                            .padding(
                                EdgeInsets(
                                    top: 5,
                                    leading: 10,
                                    bottom: 5,
                                    trailing: 10
                                )
                            )
                    )
                }
            }
        }
        .listStyle(.plain)
        .task {
            await viewModel.fetchRecipeData()
        }.alert("", isPresented: $viewModel.hasError) {} message: {
            Text(viewModel.errorMessage)
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(Favorites())
    }
}
