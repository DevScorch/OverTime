//
//  AgendaView.swift
//  ScorchTime
//
//  Created by Johan Sas on 16/02/2021.
//

import SwiftUI

struct AgendaView: View {
    var body: some View {
        NavigationView {
            Text("")
                .navigationBarTitle(Text("Agenda"))
            
            VStack {
                Text("OverView")
                    .bold()
                    .font(.system(size: 20))

            }
        }
    }
}

struct AgendaView_Previews: PreviewProvider {
    static var previews: some View {
        AgendaView()
    }
}
