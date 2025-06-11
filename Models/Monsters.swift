//
//  Monsters.swift
//  DandDMonsters
//
//  Created by Laura Steiner on 6/10/25.
//

import Foundation

class Monster: Codable, Identifiable {
	let id = UUID().uuidString
	var index: String
	var name: String
	var url: String
	
	enum CodingKeys: CodingKey {
		case index
		case name
		case url
	}
	
	init(index: String, name: String, url: String) {
		self.index = index
		self.name = name
		self.url = url
	}
}
