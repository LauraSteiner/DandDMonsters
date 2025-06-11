//
//  MonsterDetailView.swift
//  DandDMonsters
//
//  Created by Laura Steiner on 6/10/25.
//

import SwiftUI

struct MonsterDetailView: View {
	@State var monster: Monster
	@State var monsterDetailVM = MonsterDetailViewModel()
	var body: some View {
		VStack{
			Text(monster.name)
				.bold()
				.font(.largeTitle)
				.padding(.bottom)
			HStack{
				VStack(alignment: .leading){
					Text("Type:")
						.bold()
					Text(monsterDetailVM.type.capitalized)
						.padding(.bottom)
					
					Text("Alignment:")
						.bold()
					Text(monsterDetailVM.alignment.capitalized)
				}
				
				Spacer()
				
				VStack(alignment: .leading){
					Text("Size:")
						.bold()
					Text(monsterDetailVM.size.capitalized)
						.padding(.bottom)
					
					Text("Hit Points:")
						.bold()
					Text("\(monsterDetailVM.hitPoints)")
				}
			}
			.padding(.horizontal)
		}
		.padding()
		.task{
			monsterDetailVM.urlString = monsterDetailVM.baseURL + monster.url
			await monsterDetailVM.getData()
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
