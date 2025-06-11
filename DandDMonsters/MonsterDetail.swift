//
//  MonsterDetail.swift
//  DandDMonsters
//
//  Created by Laura Steiner on 6/11/25.
//

import Foundation


@Observable
class MonsterDetail {
	var urlString = ""
	var name: String = ""
	var size: String = ""
	var type: String = ""
	var alignment: String = ""
	var hit_points: Int = 0
	//var imageURL = ""
	var image: String? = ""
	
	private struct Returned: Codable {
		var name: String
		var size: String
		var type: String
		var alignment: String
		var hit_points: Int
	}
	
//	struct Sprite: Codable {
//		var front_default: String
//	}

	func getData() async {
		print("We are accessing the URL \(urlString)")
		guard let url = URL(string: MonstersViewModel.baseURL +  urlString) else {
			print("ERROR -- Could not create URL from \(urlString)")
			return
		}
		
		do {
			let (data, _) = try await URLSession.shared.data(from: url)
			guard let returned = try? JSONDecoder().decode(Returned.self, from: data) else {
				print("ERROR -- could not decode data from \(urlString)")
				return
			}
			
			self.name = returned.name
			self.size = returned.size
			self.type = returned.type
			self.alignment = returned.alignment
			self.hit_points = returned.hit_points
			
			//self.imageURL = returned.sprites.front_default
		} catch {
			print("ERROR -- Could not get data from \(urlString): \(error.localizedDescription)")
		}
	}
}
