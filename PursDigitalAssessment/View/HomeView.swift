//
//  ContentView.swift
//  PursDigitalAssessment
//
//  Created by Akhil Anand Sirra on 16/06/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var favorites = Favorites() 
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(UIColor.secondarySystemFill).ignoresSafeArea() // For not changing the background when keyboard is used
                RecipeListView()
                    .navigationTitle("Recipes")
            }
        }
        .navigationViewStyle(StackNavigationViewStyle()) // To avoid sidebar on iPad
        .environmentObject(favorites)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
