//
//  MonsterDetailView.swift
//  DandDMonsters
//
//  Created by Laura Steiner on 6/10/25.
//

import SwiftUI

struct MonsterDetailView: View {
	@State var monster: Monster
    var body: some View {
		Text(monster.name)
    }
}

#Preview {
	MonsterDetailView(monster: Monster(
		index: "adult-gold-dragon",
		name: "Adult Gold Dragon",
		url: "/api/2014/monsters/adult-gold-dragon")
	)
}
