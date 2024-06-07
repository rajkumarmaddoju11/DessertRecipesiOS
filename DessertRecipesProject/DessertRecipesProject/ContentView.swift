//
//  ContentView.swift
//  DessertRecipesProject
//
//  Created by Raj Kumar Maddoju on 6/6/24.
//

import SwiftUI


struct ContentView: View {
    @StateObject var viewModel = DessertViewModel()
    
    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                } else if let errorMessage = viewModel.errorMessage {
                    Text("Error: \(errorMessage)")
                        .foregroundColor(.red)
                } else {
                    List(viewModel.desserts) { meal in
                        NavigationLink(destination: MealDetailView(mealID: meal.idMeal)) {
                            HStack {
                                AsyncImage(url: URL(string: meal.strMealThumb)) { image in
                                    image.resizable()
                                } placeholder: {
                                    Color.gray
                                }
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                                
                                Text(meal.strMeal)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Desserts")
            .onAppear {
                viewModel.fetchDesserts()
            }
        }
    }
}

struct MealDetailView: View {
    @StateObject var viewModel = MealDetailViewModel()
    var mealID: String
    
    var body: some View {
        ScrollView {
            if viewModel.isLoading {
                ProgressView("Loading...")
            } else if let errorMessage = viewModel.errorMessage {
                Text("Error: \(errorMessage)")
                    .foregroundColor(.red)
            } else if let meal = viewModel.mealDetail {
                VStack(alignment: .leading, spacing: 20) {
                    Text(meal.strMeal)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text("Instructions")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text(meal.strInstructions)
                    
                    Text("Ingredients")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    ForEach(meal.ingredientList(), id: \.self) { ingredient in
                        Text(ingredient)
                    }
                }
                .padding()
            }
        }
        .onAppear {
            viewModel.fetchMealDetail(mealID: mealID)
        }
    }
}
