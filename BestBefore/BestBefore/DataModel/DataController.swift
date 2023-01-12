//
//  DataController.swift
//  Gros
//
//  Created by Jude Alatawi on 17/06/1444 AH.
//

import Foundation
import CoreData

class DataController : ObservableObject {
    let container = NSPersistentContainer(name: "FoodModel")
    init(){
        container.loadPersistentStores{ desc, error in
            if let error = error{
                print("failed\(error.localizedDescription)")
                
            }
            
        }
    }
    
    func save(context : NSManagedObjectContext){
        do{
            try context.save()
            print("saved the data 🥳")
        }catch{
            print("ops the data isn't saved 😃...")
        }
    }
    
    func addFood(name : String, context : NSManagedObjectContext,emoji : String ,exp : Date){
        let food = Grosy(context: context)
        food.id = UUID()
        food.name = name
        food.emoji = emoji
        food.exp = exp
        food.saved = false
        
        save(context: context)
    }
    
    func editFood(food: Grosy, name : String, context : NSManagedObjectContext,emoji :String, exp : Date, saved : Bool){
        food.name = name
        food.emoji = emoji
        food.exp = exp
        food.saved = saved
        save(context: context)
        
        
    }
    
    
    
    
}
