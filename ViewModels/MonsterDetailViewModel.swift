//
//  MonsterDetailViewModel.swift
//  DandDMonsters
//
//  Created by Laura Steiner on 6/11/25.
//

import Foundation


@Observable
class MonsterDetailViewModel {
	var urlString = ""
	var name: String = ""
	var size: String = ""
	var type: String = ""
	var alignment: String = ""
	var hitPoints: Int = 0
	var imageURL: String? = ""
	var baseURL = "https://www.dnd5eapi.co"

	func getData() async {
		print("We are accessing the URL \(urlString)")
		//guard let url = URL(string: MonstersViewModel.baseURL +  urlString) else {
		guard let url = URL(string: urlString) else {
			print("ERROR -- Could not create URL from \(urlString)")
			return
		}
		
		do {
			let (data, _) = try await URLSession.shared.data(from: url)
			guard let returned = try? JSONDecoder().decode(MonsterDetail.self, from: data) else {
				print("ERROR -- could not decode data from \(urlString)")
				return
			}
			
			self.name = returned.name
			self.size = returned.size
			self.type = returned.type
			self.alignment = returned.alignment
			self.hitPoints = returned.hit_points
			self.imageURL = baseURL + (returned.image ?? "")
		} catch {
			print("ERROR -- Could not get data from \(urlString): \(error.localizedDescription)")
		}
	}
}
