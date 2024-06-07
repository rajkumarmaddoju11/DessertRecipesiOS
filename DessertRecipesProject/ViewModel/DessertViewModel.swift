//
//  DessertViewModel.swift
//  DessertRecipesProject
//
//  Created by Raj Kumar Maddoju on 6/6/24.
//

import Foundation
import Combine

class DessertViewModel: ObservableObject {
    @Published var desserts: [Meal] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private var apiService = APIService()
    private var cancellables = Set<AnyCancellable>()
    
    func fetchDesserts() {
        isLoading = true
        apiService.fetchDesserts()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                self?.isLoading = false
                switch completion {
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] meals in
                self?.desserts = meals.sorted { $0.strMeal < $1.strMeal }
            })
            .store(in: &cancellables)
    }
}

class MealDetailViewModel: ObservableObject {
    @Published var mealDetail: MealDetail?
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private var apiService = APIService()
    private var cancellables = Set<AnyCancellable>()
    
    func fetchMealDetail(mealID: String) {
        isLoading = true
        apiService.fetchMealDetails(mealID: mealID)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                self?.isLoading = false
                switch completion {
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] mealDetail in
                self?.mealDetail = mealDetail
            })
            .store(in: &cancellables)
    }
}
