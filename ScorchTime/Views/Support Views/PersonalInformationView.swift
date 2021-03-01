//
//  PersonalInformationView.swift
//  ScorchTime
//
//  Created by Johan  on 17/02/2021.
//

import SwiftUI
import CoreData

struct PersonalInformationView: View {
    
    // MARK: Variabels
    
    let defaults = UserDefaults.standard
    
    @State var name = UserDefaults.standard.string(forKey: "name") ?? ""
    @State var lastName: String = UserDefaults.standard.string(forKey: "lastname") ?? ""
    @State var address: String = UserDefaults.standard.string(forKey: "address") ?? ""
    @State var postalCode: String = UserDefaults.standard.string(forKey: "postalcode") ?? ""
    @State var city: String = UserDefaults.standard.string(forKey: "city") ??  ""
    @State var country: String = UserDefaults.standard.string(forKey: "country") ?? ""
    
    
    
    // MARK: Environment private
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 245/255, green: 245/255, blue: 249/255)
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
                VStack {
                    Form {
                        Section(header: Text("Personal Information")) {
                            TextField("First name", text: $name)
                            TextField("Last name", text: $lastName)
                            TextField("Address", text: $address)
                            TextField( "Postal code", text: $postalCode)
                            TextField("City", text: $city)
                            TextField( "country", text: $country)
                        }
                        
                        Section(header: Text("")) {
                            Button(action: {
                                savetoUserDefaults(name: name, lastname: lastName, address: address, postalCode: postalCode, city: city, country: country)
                                
                                presentationMode.wrappedValue.dismiss()
                            }, label: {
                                Text("Save your information")
                                    .foregroundColor(.pink)
                            })
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Personal Information"))
        }
    }
}



struct PersonalInformationView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalInformationView()
    }
}

// MARK: Extensions

extension PersonalInformationView {
    func savetoUserDefaults(name: String, lastname: String, address: String, postalCode: String, city: String, country: String) {
        
        let defaults = UserDefaults.standard
        
        defaults.set(name, forKey: "name")
        defaults.set(lastname, forKey: "lastname")
        defaults.set(address, forKey: "address")
        defaults.set(postalCode, forKey: "postalcode")
        defaults.set(city, forKey: "city")
        defaults.set(country, forKey: "country")
        
        debugPrint(name)
        debugPrint(lastname)
        debugPrint(address)
        debugPrint(postalCode)
        debugPrint(city)
        debugPrint(country)
    }
}
