//
//  MonsterDetailView.swift
//  DandDMonsters
//
//  Created by Laura Steiner on 6/10/25.
//

import SwiftUI

struct MonsterDetailView: View {
	@State var monster: Monster
	@State var monsterDetail = MonsterDetail()
    var body: some View {
		VStack{
			Text(monster.name)
			Text(monsterDetail.type)
			
//			AsyncImage(url: URL(string: monsterDetail.image)!){ image in
//				
//			}
		}
		.task{
			monsterDetail.urlString = monster.url
			await monsterDetail.getData()
		}
    }
}

#Preview {
	MonsterDetailView(monster: Monster(
		index: "adult-gold-dragon",
		name: "Adult Gold Dragon",
		url: "/api/2014/monsters/adult-gold-dragon")
	)
}
