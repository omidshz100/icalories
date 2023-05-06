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
                        NavigationLink(destination: EditFoodView(food: food)) {
                            HStack{
                                VStack(alignment: .leading, spacing: 6){
                                    Text(food.name!)
                                        .bold()
                                    Text("\(Int(food.calories))") + Text(" Calories")
                                        .foregroundColor(.red)
                                }
                                Spacer()
                                Text(calTimeSince(date: food.date!))
                                    .foregroundColor(.gray)
                                    .italic()
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
    
    private func deletFood(offsets:IndexSet){
        withAnimation {
            offsets.map{foods[$0]}.forEach(context.delete)
            
            DataController().save(context: context)
        }
    }
    private func totalCaloriesToday() -> Double{
        var caloriesToday = 0.0
        for itemFood in foods{
            if Calendar.current.isDateInToday(itemFood.date!) {
                caloriesToday += itemFood.calories
            }
        }
        
        return caloriesToday
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
