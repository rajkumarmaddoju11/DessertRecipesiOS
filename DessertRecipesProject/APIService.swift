//
//  APIService.swift
//  DessertRecipesProject
//
//  Created by Raj Kumar Maddoju on 6/6/24.
//

import Foundation
import Combine

class APIService {
    func fetchDesserts() -> AnyPublisher<[Meal], Error> {
        let urlString = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
        guard let url = URL(string: urlString) else {
            return Fail(error: URLError(.badURL))
                .eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: MealResponse.self, decoder: JSONDecoder())
            .map { $0.meals }
            .eraseToAnyPublisher()
    }
    
    func fetchMealDetails(mealID: String) -> AnyPublisher<MealDetail, Error> {
        let urlString = "https://themealdb.com/api/json/v1/1/lookup.php?i=\(mealID)"
        guard let url = URL(string: urlString) else {
            return Fail(error: URLError(.badURL))
                .eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: MealDetailResponse.self, decoder: JSONDecoder())
            .compactMap { $0.meals.first }
            .eraseToAnyPublisher()
    }
}
