//
//  CharacterRow.swift
//  niftyinitiativetracker
//
//  Created by Iiro Alhonen on 20.2.2022.
//

import SwiftUI

struct CharacterRow: View {
    
    let character: PlayerCharacter
    
    var body: some View {
        HStack {
            Text(character.name)
            Spacer()
            Text("\(getInitiativeCount(roll: character.initiativeRoll, modifier: character.modifier))")
        }
        .font(.title3)
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 25)
                .stroke(
                    character.isPC ? .blue : .red,
                    lineWidth: 5
                )
        )
        .padding(.horizontal)
        .padding(.bottom, 5)
    }
    
    private func getInitiativeCount(roll: Int, modifier: Int) -> Int {
        let initiative = roll + modifier
        if initiative > 0 {
            return initiative
        } else {
            return 0
        }
    }
}

struct CharacterRow_Previews: PreviewProvider {
    static var previews: some View {
        CharacterRow(character:
                        PlayerCharacter(
                            name: "Skaar Lonehunter Hulkar",
                            player: "Iiro",
                            initiativeRoll: 18,
                            modifier: -1
                        )
        )
    }
}