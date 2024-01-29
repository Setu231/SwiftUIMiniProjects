//
//  CocktailEntryVC.swift
//  SwiftUIMiniProjects
//
//  Created by Setu Desai on 1/24/24.
//

import SwiftUI

struct CocktailEntryVC: View {
    
    let cocktailAPIString = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita"
    @State var drinkItemList = DrinkList()
    
    var body: some View {
        NavigationStack() {
            List {
                ForEach(drinkItemList.drinks ?? [Drinks]()) { drink in
                    NavigationLink(drink.strDrink ?? "", value: drink)
                }
            }.navigationDestination(for: Drinks.self) { item in
                CocktailDetailScreen(drinkItem: item)
            }
        }.onAppear {
            taskFetchData()
        }
    }
    
    func taskFetchData() {
        Task {
            do {
                drinkItemList = try await fetchAPIData()
            } catch {
                throw JPError.invalidError
            }
        }
    }
    
    func fetchAPIData() async throws -> DrinkList {
        guard let url = URL(string: cocktailAPIString) else {
            throw JPError.urlError
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw JPError.noResponseError
        }
        
        do {
            return try JSONDecoder().decode(DrinkList.self, from: data)
        } catch {
            throw JPError.jsonError
        }
    }
}

struct CocktailEntryVC_Previews: PreviewProvider {
    static var previews: some View {
        CocktailEntryVC()
    }
}
