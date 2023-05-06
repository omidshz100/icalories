//
//  ContentView.swift
//  iCalories
//
//  Created by Omid Shojaeian Zanjani on 06/05/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment (\.managedObjectContext) var context
    @FetchRequest(sortDescriptors:[SortDescriptor(\.date, order:.reverse)]) var foods:FetchedResults<Food>
    
    @State private var showingAddView = false
    
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading){
                Text("\(Int(totalCaloriesToday())) kcal (Today)")
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                List{
                    ForEach(foods){ food in
                        NavigationLink(destination: Text("\(food.calories)")) {
                            
                            HStack{
                                VStack(alignment: .leading, spacing: 6){
                                    Text(food.name!)
                                        .bold()
                                    Text("\(Int(food.calories))") + Text(" Calories")
                                        .foregroundColor(.red)
                                    
                                    Spacer()
                                    Text(calTimeSince(date: food.date!))
                                        .foregroundColor(.gray)
                                        .italic()
                                    
                                }
                            }
                        }
                    }
                    .onDelete(perform: deletFood)
                }
                .listStyle(.plain)
            }
            .navigationTitle("iCalories")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button{
                        showingAddView.toggle()
                    }label: {
                        Label("Add food", systemImage: "plus.circle")
                    }
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
            }
            .sheet(isPresented: $showingAddView) {
                AddFoodView()
            }
        }
        .navigationViewStyle(.stack)
    }
    
    private func deletFood(item:IndexSet){
            
    }
    private func totalCaloriesToday() -> Double{
        return 0.0
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
