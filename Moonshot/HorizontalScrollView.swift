//
//  HorizontalScrollView.swift
//  Moonshot
//
//  Created by Mark Bear on 04.10.2022.
//

import SwiftUI

struct HorizontalScrollView: View {
  
  let mission: Mission
  
  struct CrewMember {
    let role: String
    let astronaut: Astronaut
  }
  
  let crew: [CrewMember]
  
  init(mission: Mission, astronauts: [String: Astronaut]) {
    self.mission = mission
    
    self.crew = mission.crew.map { member in
      if let astronaut = astronauts[member.name] {
        return CrewMember(role: member.role, astronaut: astronaut)
      } else {
        fatalError("Missing \(member.name)")
      }
    }
  }
  
  var body: some View {
    
    ScrollView(.horizontal, showsIndicators: false) {
      
      HStack {
        ForEach(crew, id: \.role) { crewMember in
        
          NavigationLink {
            AstronautView(astronaut: crewMember.astronaut)
            
          } label: {
            
            HStack {
              
              Image(crewMember.astronaut.id)
                .resizable()
                .frame(width: 104, height: 72)
                .clipShape(Capsule())
                .overlay(
                  Capsule()
                    .strokeBorder(.white, lineWidth: 1)
                )
              
              
              
              VStack(alignment: .leading) {
                Text(crewMember.astronaut.name)
                  .foregroundColor(.white)
                  .font(.headline)
                Text(crewMember.role)
                  .foregroundColor(.secondary)
              }
              
              Rectangle()
                .frame(width: 2, height: 72)
                .foregroundColor(.lightBackground)
                .padding(.horizontal)
            }
            .padding(.horizontal)
          }
        }
      }
    }
  }
}

struct HorizontalScrollView_Previews: PreviewProvider {
  static let mission: [Mission] = Bundle.main.decode("missions.json")
  static let astronaut: [String: Astronaut] = Bundle.main.decode("astronauts.json")
  
  static var previews: some View {
    HorizontalScrollView(mission: mission[0], astronauts: astronaut)
      .preferredColorScheme(.dark)
  }
}
