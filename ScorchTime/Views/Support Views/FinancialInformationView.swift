//
//  FinancialInformationView.swift
//  ScorchTime
//
//  Created by Johan Sas on 19/02/2021.
//

import SwiftUI

struct FinancialInformationView: View {
    
    @State var rate: String = UserDefaults.standard.string(forKey: "rate") ?? ""
    @State var vat: String = UserDefaults.standard.string(forKey: "vat") ?? ""
    @State var bankAccount: String = UserDefaults.standard.string(forKey: "account") ?? ""
    @State var bank: String = UserDefaults.standard.string(forKey: "bank") ?? ""
    @State var swift: String = UserDefaults.standard.string(forKey: "swift") ?? ""
    
    // MARK: Environment variables
    
    @Environment(\.presentationMode) var presentationMode

    
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 245/255, green: 245/255, blue: 249/255)
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
                VStack {
                    Form {
                        Section(header: Text("Financial Information")) {
                            TextField("Hourly Rate", text: $rate)
                            TextField("VAT", text: $vat)
                            TextField("Bankacount Number", text: $bankAccount)
                            TextField("Bank", text: $bank)
                            TextField("SWIFT Code", text: $swift)
                          
                        }
                        
                        Section(header: Text("")) {
                            Button(action: {
                                saveToUserDefaults(rate: rate, vat: vat, bankAccount: bankAccount, bank: bank, swift: swift)
                                
                                presentationMode.wrappedValue.dismiss()
                            }, label: {
                                Text("Save your information")
                                    .foregroundColor(.pink)
                            })
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Financial Information"))
        }
    }
}

extension FinancialInformationView {
    func saveToUserDefaults(rate: String, vat: String, bankAccount: String, bank: String, swift: String) {
        let defaults = UserDefaults.standard
        
        defaults.set(rate, forKey: "rate")
        defaults.set(vat, forKey: "vat")
        defaults.set(bankAccount, forKey: "account")
        defaults.set(bank, forKey: "bank")
        defaults.set(swift, forKey: "swift")
        
        debugPrint(rate)
        debugPrint(vat)
        debugPrint(bankAccount)
        debugPrint(bank)
        debugPrint(swift)
        
    }
}

struct FinancialInformationView_Previews: PreviewProvider {
    static var previews: some View {
        FinancialInformationView()
    }
}
