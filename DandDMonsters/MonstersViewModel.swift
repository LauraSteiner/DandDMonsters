//
//  MonstersViewModel.swift
//  DandDMonsters
//
//  Created by Laura Steiner on 6/10/25.
//

import Foundation

@Observable
class MonstersViewModel {
	var urlString = "https://www.dnd5eapi.co/api/2014/monsters"
	var baseURL = "https://www.dnd5eapi.co"
	var count = 0
	var isLoading = false
	var monsters: [Monster] = []
	
// This works, but the test says to load when View appears.
	
//	init(){
//		Task {
//			await self.getData()
//		}
//	}
	
	private struct Returned: Codable {
		var count: Int
		var results: [Monster]
	}
	
	func getData() async {
		isLoading = true
		guard let url = URL(string: urlString) else {
			print("ERROR -- Could not create URL from \(urlString)")
			isLoading = false
			return
		}
		
		do {
			let (data, _) = try await URLSession.shared.data(from: url)
			guard let returned = try? JSONDecoder().decode(Returned.self, from: data) else {
				print("ERROR -- could not decode data from \(urlString)")
				isLoading = false
				return
			}
			Task { @MainActor in
					self.count = returned.count
					self.monsters = returned.results
					isLoading = false
				}
			
		} catch {
			print("ERROR -- Could not get data from \(urlString): \(error.localizedDescription)")
			isLoading = false
		}
	}
	
}
