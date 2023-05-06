//
//  DataController.swift
//  iCalories
//
//  Created by Omid Shojaeian Zanjani on 06/05/23.
//

import Foundation
import CoreData


struct DConstants{
    static let persistentName:String = "FoodModel"
    private init(){}
}

class DataController:ObservableObject {
    
    var container = NSPersistentContainer(name: DConstants.persistentName)
    
    init() {
        self.container.loadPersistentStores { description, error in
            if let error = error {
                print("Faild to load Data ..... >>  \(error.localizedDescription) ")
            }
        }
    }
    
    func save(context:NSManagedObjectContext){
        do{
            try context.save()
            print("Data Saved, WHo hoooo")
        }
        catch{
            print("We could not save the data .... ")
        }
    }
    
    func addFood(name:String, calories:Double, context:NSManagedObjectContext){
        let food = Food(context: context)
        food.id = UUID()
        food.date = Date()
        food.name = name
        food.calories = calories
        // then Save the data in CoreDATA
        save(context: context)
    }
    
    func editFood(food:Food,name:String, calories:Double, context:NSManagedObjectContext){
        
        
        food.date = Date()
        food.name = name
        food.calories = calories
        
        // save data in CoreData
        save(context: context)
    }
}
