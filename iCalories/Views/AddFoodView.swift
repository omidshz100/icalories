//
//  AddFoodView.swift
//  iCalories
//
//  Created by Omid Shojaeian Zanjani on 06/05/23.
//

import SwiftUI

struct AddFoodView: View {
    @Environment (\.managedObjectContext) var context
    
    @Environment (\.dismiss) var dismiss
    
    @State private var name:String = ""
    @State private var calories:Double = 0.0
    
    
    var body: some View {
        Form{
            Section{
                Text("Food Name:")
                TextField("Food Name: ", text: $name)
                VStack{
                    HStack{
                        Text("Calories")
                        Spacer(minLength: 10)
                        Text("\(Int(calories))")
                    }
                    Slider(value: $calories, in: 0...1000) {
                        Text("Title")
                    } minimumValueLabel: {
                        Text("0")
                    } maximumValueLabel: {
                        Text("1000")
                    }.padding()
                    
                    HStack{
                        Button("Submit"){
                            DataController().addFood(name: name, calories: calories, context: context)
                            // after adding to the DB dissmiss the page
                            dismiss()
                        }
                    }
                }
                
            }
        }
    }
}

struct AddFoodView_Previews: PreviewProvider {
    static var previews: some View {
        AddFoodView()
    }
}
