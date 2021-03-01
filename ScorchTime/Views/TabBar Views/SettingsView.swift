//
//  SettingsView.swift
//  ScorchTime
//
//  Created by Johan Sas on 16/02/2021.
//

import SwiftUI

struct SettingsView: View {
    
    // MARK: Variables
    
    @State var isPresented = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 245/255, green: 245/255, blue: 249/255)
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
                VStack {
                    Form {
                        Section(header: Text("Personal Information")) {
                            Button(action: {
                                print("")
                                
                                self.isPresented.toggle()
                                
                            }) {
                                HStack {
                                    Image(systemName: "person.crop.circle")
                                        .resizable()
                                        .frame(width: 20.0, height: 20.0)
                                    Text("Personal Information")
                                        .foregroundColor(.black)
                                }
                            }.sheet(isPresented: $isPresented, content: {
                                PersonalInformationView()
                            })
                            
                            Button(action: {
                                print("Open Financial View")
                                
                                self.isPresented.toggle()
                            }) {
                                HStack {
                                    Image(systemName: "dollarsign.circle")
                                        .resizable()
                                        .frame(width: 20.0, height: 20.0)
                                    Text("Financial Information")
                                        .foregroundColor(.black)
                                }
                            }.sheet(isPresented: $isPresented, content: {
                                FinancialInformationView()
                            })
                        }
                        Section(header: Text("Privacy information")) {
                            Button(action: {
                                print("")
                                self.isPresented.toggle()
                            }) {
                                HStack {
                                    Image(systemName: "info.circle")
                                        .resizable()
                                        .frame(width: 20.0, height: 20.0)
                                    Text("Privacy Information")
                                        .foregroundColor(.black)
                                }
                                
                            }.sheet(isPresented: $isPresented, content: {
                                PrivacyInformationView()
                            })
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Settings"))
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
