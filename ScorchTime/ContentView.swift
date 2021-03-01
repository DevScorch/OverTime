//
//  ContentView.swift
//  ScorchTime
//
//  Created by Johan Sas on 16/02/2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
    

    var body: some View {
        ZStack {
            VStack {
                TabView {
                    DashboardView()
                        .tabItem {
                            Image(systemName: "house")
                            Text("Dashboard")
                        }
                    AgendaView()
                        .tabItem {
                            Image(systemName: "calendar")
                            Text("Agenda")
                        }
                    InvoiceView()
                        .tabItem {
                            Image(systemName: "paperclip")
                            Text("Invoices")
                        }
                    TimerView()
                        .tabItem {
                            Image(systemName: "timer")
                            Text("Timers")
                        }
                    SettingsView()
                        .tabItem {
                            Image(systemName: "command")
                            Text("Settings")
                        }
                }.accentColor(Color.pink)
            }
        }
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
