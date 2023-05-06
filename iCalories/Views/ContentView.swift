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
                                    Text("\(food.calories)") + Text("Calories")
                                        .foregroundColor(.red)
                                    
                                    Spacer()
                                    Text("")
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("iCalories")
        }
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
