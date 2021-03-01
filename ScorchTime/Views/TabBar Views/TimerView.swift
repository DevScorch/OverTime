//
//  TimerView.swift
//  ScorchTime
//
//  Created by Johan Sas on 16/02/2021.
//

import SwiftUI

struct TimerView: View {
    
    
    // MARK: State variables
    
    @State var seconds: Int = 0
    @State var minutes: Int = 0
    @State var hours: Int = 0
    @State var timerIsPaused: Bool = false
    @State var timer: Timer? = nil
    
    
    
    
    // MARK: Environment private variables
    
    @Environment(\.managedObjectContext) var viewContext
    
    // CoreData FetchRequests
    @FetchRequest(entity: Timers.entity(), sortDescriptors:
                    [NSSortDescriptor(keyPath: \Timers.name, ascending: true)])
    var timers: FetchedResults<Timers>
    
    var body: some View {
        NavigationView {
            ZStack {
                    VStack {
                        List {
                            ForEach(timers) { timer in
                                HStack {
                                    
                                    VStack {
                                        Text("\(timer.name!)")
                                            .bold()
                                            .font(.system(size: 15))
                                            .foregroundColor(.white)
                                    }.padding().background(RoundedRectangle(cornerRadius: 22).foregroundColor(Color(red: 19/255, green: 18/255, blue: 88/255)).frame(width: 110, height: 45))
                                    Spacer()
                                    VStack(alignment: .center) {
                                        
                                      
                                        Text("H: \(hours) M: \(minutes) S: \(seconds)")
                                        
                                    }

                                    .padding(.vertical, 5.0)
                                    Spacer()
                                    Button(action: {
                                        print("Start Timer")
                                        startTimer()
                                        
                                    }) {
                                        
                                        Image(systemName: "play.fill")
                                            .foregroundColor(.pink)
                                    }
                                }.padding(.horizontal, 10.0).frame(height: 50)
                                

                            }.onDelete { indexSet in
                                for index in indexSet {
                                    viewContext.delete(timers[index])
                                }
                                do {
                                    try viewContext.save()
                                } catch {
                                    print(error.localizedDescription)
                                }
                            }
                            
                            
                        }.padding(.top, 15.0).listStyle(PlainListStyle())
                        
                    }.navigationBarItems(trailing: NavigationLink(
                                            destination: CreateTimerView()) {
                                                Image(systemName: "plus")
                                            }).navigationBarTitle(Text("Timers"))
                
            }
            
        }
    }
}

extension TimerView {
    func startTimer() {
        timerIsPaused = false
        _ = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { tempTimer in
            
            if self.seconds == 59 {
                self.seconds = 0
                if self.minutes == 59 {
                    self.minutes = 0
                    self.hours = self.hours + 1
                } else {
                    self.minutes = self.minutes + 1
                }
            } else {
                self.seconds = self.seconds + 1
            }
            
        }
    }
    
    func stopTimer() {
        timerIsPaused = true
        timer?.invalidate()
        timer = nil
    }
    
    
}


struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
