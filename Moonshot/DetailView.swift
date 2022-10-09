//
//  DetailView.swift
//  Moonshot
//
//  Created by Mark Bear on 02.10.2022.
//

import SwiftUI

struct DetailView: View {
  // MARK: - PROPERTIES
  
  let mission: Mission
  
  static let astronaut: [String: Astronaut] = Bundle.main.decode("astronauts.json")
  
//  struct CrewMember {
//    let role: String
//    let astronaut: Astronaut
//  }
//
//  let crew: [CrewMember]
//
//  init(mission: Mission, astronauts: [String: Astronaut]) {
//    self.mission = mission
//
//    self.crew = mission.crew.map { member in
//      if let astronaut = astronauts[member.name] {
//        return CrewMember(role: member.role, astronaut: astronaut)
//      } else {
//        fatalError("Missing \(member.name)")
//      }
//    }
//  }
  
  // MARK: - BODY
  var body: some View {
    GeometryReader { geometry in
      ScrollView {
        VStack {
        
          Image(mission.image)
            .resizable()
            .scaledToFit()
            .frame(maxWidth: geometry.size.width * 0.6)
            .padding(.top)
          
          Text("Launch date: \(mission.formattedLaunchDate)")
            .font(.subheadline.bold())
            .foregroundColor(.gray)
            .padding(.top, 5)
          
          VStack(alignment: .leading) {
            Rectangle()
              .frame(height: 2)
              .foregroundColor(.lightBackground)
              .padding(.vertical)
            
            Text("Mission Highlights")
              .font(.title.bold())
              .padding(.bottom, 5)
            
            Text(mission.description)
            
            Rectangle()
              .frame(height: 2)
              .foregroundColor(.lightBackground)
              .padding(.vertical)
            
            Text("Crew")
              .font(.title.bold())
              .padding(.bottom, 5)
          }
          .padding(.horizontal)

          HorizontalScrollView(mission: mission, astronauts: DetailView.astronaut)
          
        }
        .padding(.bottom)
      }
    }
    .navigationTitle(mission.displayName)
    .navigationBarTitleDisplayMode(.inline)
    .background(.darkBackground)
  }
}


// MARK: - PREVIEW
struct DetailView_Previews: PreviewProvider {
  static let mission: [Mission] = Bundle.main.decode("missions.json")
  
  static var previews: some View {
    NavigationView {
      DetailView(mission: mission[0])
        .preferredColorScheme(.dark)
    }
  }
}
