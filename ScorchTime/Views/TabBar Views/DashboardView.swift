//
//  DashboardView.swift
//  ScorchTime
//
//  Created by Johan Sas on 16/02/2021.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 245/255, green: 245/255, blue: 249/255)
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
                ScrollView() {
                    VStack {
                        HStack {
                            Text("OverView")
                                .foregroundColor(Color(red: 57/255, green: 57/255, blue: 57/255))
                                .fontWeight(.bold)
                                .padding(.leading, 10)
                                .font(.system(size: 20))
                                .multilineTextAlignment(.center)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                        }
                        .padding(.top, 20.0)
                        
                        HStack(alignment: .center) {
                            Image("time")
                                .resizable()
                                .frame(width: 68, height: 68, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            VStack {
                                Text("Worked hours")
                                    .foregroundColor(Color(red: 57/255, green: 57/255, blue: 57/255))
                                    .font(.system(size: 14))
                                    .bold()
                                
                                Text("140")
                                    .foregroundColor(Color(red: 57/255, green: 57/255, blue: 57/255))
                                    .font(.system(size: 12))
                                    .multilineTextAlignment(.trailing)
                                    .padding(.top, 2)
                                    .padding(.leading, 1)
                            }
                            
                            Spacer()
                        }
                        .padding(.all, 15.0)
                        .background(RoundedRectangle(cornerRadius: 22).foregroundColor(.white).frame(width: nil, height: 94, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/))
                        
                        HStack(alignment: .center) {
                            Image("money-yellow")
                                .resizable()
                                .frame(width: 68, height: 68, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            VStack {
                                Text("Billable hours")
                                    .font(.system(size: 14))
                                    .foregroundColor(Color(red: 57/255, green: 57/255, blue: 57/255))
                                    .bold()
                                
                                Text("140")
                                    .font(.system(size: 12))
                                    .foregroundColor(Color(red: 57/255, green: 57/255, blue: 57/255))
                                    .multilineTextAlignment(.trailing)
                                    .padding(.top, 2)
                                    .padding(.leading, 1)
                            }
                            
                            Spacer()
                        }
                        .padding(.all, 15.0)
                        .background(RoundedRectangle(cornerRadius: 22).foregroundColor(.white).frame(width: nil, height: 94, alignment: .center))
                        
                        HStack(alignment: .center) {
                            Image("money-orange")
                                .resizable()
                                .frame(width: 68, height: 68, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            VStack {
                                Text("Expenses")
                                    .font(.system(size: 14))
                                    .foregroundColor(Color(red: 57/255, green: 57/255, blue: 57/255))
                                    .bold()
                                
                                Text("140")
                                    .font(.system(size: 12))
                                    .foregroundColor(Color(red: 57/255, green: 57/255, blue: 57/255))
                                    .multilineTextAlignment(.trailing)
                                    .padding(.top, 2)
                                    .padding(.leading, 1)
                            }
                            Spacer()
                        }
                        .padding(.all, 15.0)
                        .background(RoundedRectangle(cornerRadius: 22).foregroundColor(.white).frame(width: nil, height: 94, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/))
                        HStack {
                            Text("Timers")
                                .foregroundColor(Color(red: 57/255, green: 57/255, blue: 57/255))
                                .fontWeight(.bold)
                                .padding(.leading, 10)
                                .font(.system(size: 20))
                                .multilineTextAlignment(.center)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        
                        
                        Spacer()
                    }
                    .navigationBarTitle(Text("Dashboard"))
                }
            }
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
