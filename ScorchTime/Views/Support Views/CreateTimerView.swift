//
//  CreateTimerView.swift
//  ScorchTime
//
//  Created by Johan Sas on 16/02/2021.
//

import SwiftUI
import CoreData

struct CreateTimerView: View {
    
    // MARK: Job Array
    
    //let jobs = ["Coding", "Design", "Editing", "Photography", "Recording", "Debugging"]
    let newJobs = [""]
    
    // MARK: Variables
    
    let defaults = UserDefaults.standard
    
    // MARK: State Variables
    
    @State var selectedJobIndex = 0
    @State var jobTitle = ""
    @State var newJobTitle = ""
    @State var showingAlert = false
    
    
    // MARK: Environment private variables
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment (\.presentationMode) var presentationMode
    
    // MARK FetchRequests
    
    @FetchRequest(entity: Jobs.entity(), sortDescriptors:
                    [NSSortDescriptor(keyPath: \Jobs.title, ascending: true)])
    var jobs: FetchedResults<Jobs>
    
    var body: some View {
        ZStack {
            Color(red: 245/255, green: 245/255, blue: 249/255)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack {
                Form {
                    Section(header: Text("Add a new Timer")) {
                        TextField("Timer name", text: $jobTitle)
                        Picker(selection: $selectedJobIndex, label: Text("Job type")) {
                            ForEach(jobs, id: \.id) { (jobs: Jobs) in
                                Text(jobs.title!).tag(jobs.id)
                            }
                        }
                    }
                    
                    Button(action: {
                        if jobTitle.isEmpty {
                            self.showingAlert = true
                        } else {
                            //guard self.jobTitle != "" else {return}
                            let newTimer = Timers(context: viewContext)
                            newTimer.name = self.jobTitle
                            newTimer.job = self.jobs[self.selectedJobIndex].title
                            newTimer.id = UUID()
                            
                            do {
                                try viewContext.save()
                                print("New Timer saved")
                                presentationMode.wrappedValue.dismiss()
                                
                            } catch {
                                print(error.localizedDescription)
                            }
                        }
                    }) {
                        Text("Save Timer")
                    }
                    .alert(isPresented: $showingAlert, content: {
                        Alert(title: Text("Sorry"), message: Text("Make sure to give your timer a name before saving it!"), dismissButton: .default(Text("OK")))
                    })
                    
                    Section(header: Text("Add a new Job")) {
                        TextField("Job name", text: $newJobTitle)
                    }
                    Button(action: {
                        
                        if newJobTitle.isEmpty {
                            self.showingAlert = true
                        } else {
                            let newJob = Jobs(context: viewContext)
                            newJob.title = self.newJobTitle
                            newJob.id = UUID()
                            
                            do {
                                try viewContext.save()
                                print("New Job saved")
                                
                            } catch {
                                print(error.localizedDescription)
                            }
                        }
                        
                        
                    }) {
                        Text("Save new Job")
                    }
                }
                
            }.navigationBarTitle(Text("Add Timer"))
            Spacer()
            
        }
        
    }
    
}

struct CreateTimerView_Previews: PreviewProvider {
    static var previews: some View {
        CreateTimerView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
