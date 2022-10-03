//
//  AstronautView.swift
//  Moonshot
//
//  Created by Mark Bear on 03.10.2022.
//

import SwiftUI

struct AstronautView: View {
  // MARK: - PROPERTIES
  let astronaut: Astronaut
  // MARK: - BODY
    var body: some View {
      ScrollView {
        VStack {
          Image(astronaut.id)
            .resizable()
            .scaledToFit()
          
          Text(astronaut.description)
            .padding()
        }
      }
      .background(.darkBackground)
      .navigationTitle(astronaut.name)
      .navigationBarTitleDisplayMode(.inline)
    }
}


// MARK: - PREVIEW
struct AstronautView_Previews: PreviewProvider {
  static var astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
  
    static var previews: some View {
      AstronautView(astronaut: astronauts["aldrin"]!)
        .preferredColorScheme(.dark)
    }
}
