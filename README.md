DessertRecipesiOSApp📱🍰

DessertRecipes is an iOS application developed using SwiftUI and Combine, modern frameworks in the iOS ecosystem. This app fetches data from the MealDB API, displaying a list of dessert recipes, and showing detailed information about each recipe.


Features

    Fetch Dessert Recipes: Retrieves a list of dessert recipes from the MealDB API.
    Recipe Details: Displays detailed information about each recipe, including instructions and ingredients.
    Modern UI: Uses SwiftUI for a responsive and modern user interface.
    Reactive Programming: Utilizes Combine for handling asynchronous data fetching and state management.

Technologies

    SwiftUI: For building the user interface.
    Combine: For handling asynchronous operations and state management.
    MealDB API: Source of dessert recipe data.

Project Structure

    Models
        Meal.swift: Contains models for decoding JSON responses.
    Services
        APIService.swift: Handles API calls to fetch data from the MealDB API.
    ViewModels
        DessertViewModel.swift: Manages data and business logic for fetching dessert recipes.
        MealDetailViewModel.swift: Manages data and business logic for fetching detailed information about a specific meal.
    Views
        ContentView.swift: Displays the list of desserts and handles navigation to detail views.
        MealDetailView.swift: Displays detailed information about a selected meal.

Usage

    Fetch Dessert Recipes: On launching the app, a list of dessert recipes is fetched from the MealDB API and displayed.
    View Recipe Details: Tap on any dessert to navigate to the detail view, which shows the recipe instructions and ingredients.

Screenshots
Screenshot1(A list of dessert recipes are displayed): 
![DessertRecipeAppScreenshot1](https://github.com/rajkumarmaddoju11/DessertRecipesiOS/assets/171982770/b59adb37-9421-4770-b37d-6c641258fd89)

Screenshot2(Shows Recipe Details): 
![DessertRecipeAppScreenshot2](https://github.com/rajkumarmaddoju11/DessertRecipesiOS/assets/171982770/8d9278a0-c681-49ac-8527-936e96ae9bd8)



