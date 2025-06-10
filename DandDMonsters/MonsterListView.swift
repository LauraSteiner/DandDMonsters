//
//  ContentView.swift
//  DandDMonsters
//
//  Created by Laura Steiner on 6/10/25.
//
// https://www.dnd5eapi.co/api/2014/monsters

import SwiftUI

struct MonsterListView: View {
	//@State private var monsters: [Monster] = []
	@State var monstersVM = MonstersViewModel()
    var body: some View {
		NavigationStack{
			ZStack{
				if monstersVM.isLoading{
					ProgressView()
						.tint(.red)
						.scaleEffect(4)
				}
				List(monstersVM.monsters){
					monster in
					Text(monster.name)
						.listRowSeparator(.hidden)
						.font(.title2)
				}
				.listStyle(.plain)
				.task{
					await monstersVM.getData()
				}
			}
			.padding()
			.navigationTitle("Monsters:")
		}
		.toolbar{
//			ToolbarItem(placement: .bottomBar) {
//				Button("Load all") {
//					Task {
//						//await creatures.loadAll()
//						await creatures.loadAllRegular()
//					}
//				}
//			}
			ToolbarItem(placement: .status) {
				Text("\(monstersVM.count) monsters")
			}
		}
    }
}

#Preview {
    MonsterListView()
}
