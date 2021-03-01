//
//  InvoiceView.swift
//  ScorchTime
//
//  Created by Johan Sas on 16/02/2021.
//

import SwiftUI

struct InvoiceView: View {
    var body: some View {
        NavigationView {
            Text("")
                .navigationBarTitle(Text("Invoices"))
            
            VStack {
                Text("OverView")
                    .bold()
                    .font(.system(size: 20))

            }
        }
    }
}

struct InvoiceView_Previews: PreviewProvider {
    static var previews: some View {
        InvoiceView()
    }
}
