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
			Grid(alignment: .leading, horizontalSpacing: 12.0, verticalSpacing: 10.0) {
				GridRow( alignment: .firstTextBaseline) {
					Text("Type:")
						.bold()
					Text(monsterDetailVM.type.capitalized)
				}
				GridRow( alignment: .firstTextBaseline) {
					Text("Size:")
						.bold()
					Text(monsterDetailVM.size.capitalized)
				}
				GridRow( alignment: .firstTextBaseline) {
					Text("Alignment:")
						.bold()
					Text(monsterDetailVM.alignment.capitalized)
				}
				GridRow( alignment: .firstTextBaseline) {
					Text("Hit Points:")
						.bold()
					Text(String(monsterDetailVM.hitPoints))
				}
							
			}
			

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
