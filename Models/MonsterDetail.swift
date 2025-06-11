//
//  MonsterDetail.swift
//  DandDMonsters
//
//  Created by Laura Steiner on 6/11/25.
//

import Foundation

class MonsterDetail: Codable{
	//var urlString = ""
	var name: String = ""
	var size: String = ""
	var type: String = ""
	var alignment: String = ""
	var hit_points: Int = 0
	var image: String? = ""
	
	private struct Returned: Codable {
		var name: String
		var size: String
		var type: String
		var alignment: String
		var hit_points: Int
	}
}
