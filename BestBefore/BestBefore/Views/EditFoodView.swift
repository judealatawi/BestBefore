//
//  EditFoodView.swift
//  Gros
//
//  Created by Jude Alatawi on 18/06/1444 AH.
//

import SwiftUI

struct EditFoodView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismes
    var food: FetchedResults<Grosy>.Element
    
    @State private var name = ""
    @State private var emojii = ""
    @State private var exp = Date()
    @State private var check = false
    
    var body: some View {
        VStack{
            Form{
                Section(header: Text("Product Information").font(.system(size: 24, weight: .semibold, design: .rounded))) {
                    HStack{
                        Text("Check if you used the product:").font(.system(size: 24, weight: .regular, design: .rounded))
                        Spacer()
                    Button {
                        check.toggle()
                        
                    } label: {
                        if(check == false){
                            Image(systemName: "circle")
                                .resizable().frame(width: 20,height: 20)
                        }else{
                            Image(systemName: "checkmark.circle.fill")
                                .resizable().frame(width: 20,height: 20)
                        }
                        
                    }
                    
                }
                    HStack{
                        Text("Product Name:").font(.system(size: 24, weight: .regular, design: .rounded))
                        TextField( "", text: $name).padding().font(.custom("SF Pro Rounded", size: 21)).fontWeight(.semibold).accessibilityLabel(Text("Text field to modify the Product Name"))
                        
                    }
                    HStack{
                        Text("Product Emoji:").font(.system(size: 24, weight: .regular, design: .rounded))
                        EmojiTextField(text: $emojii, placeholder: "").padding().font(.custom("SF Pro Rounded", size: 21)).fontWeight(.semibold).accessibilityLabel(Text("Text field to modify the Product emoji"))
                    }
                    VStack{
                        HStack{
                            Text("Expiration Date:").font(.system(size: 24, weight: .regular, design: .rounded))
                            Spacer().accessibilityLabel(Text("Calender to modify the Product expiration Date"))
                        }
                        DatePicker("",selection: $exp, in: Date()..., displayedComponents: .date)
                            .font(.system(size: 15)).foregroundColor(.gray).datePickerStyle(.graphical)
                    }
                    
                }
               Button {
                    DataController().editFood(food: food, name: name, context: managedObjContext, emoji: emojii, exp: exp, saved: check)
                    dismes()
                    
                } label: {
                    Text("Save").accessibilityLabel(Text("Save button"))
                        .frame(maxWidth: .infinity,maxHeight: 39)
                        .font(.custom("SF Pro Rounded", size: 24))
                        .fontWeight(.regular)
                    
                }.frame(maxWidth: .infinity)
                    .foregroundColor(.black)
                    .background(Color("green"))
                    .cornerRadius(8)
                
            }.foregroundColor(Color.black)
                .onAppear{
                    name = food.name!
                    emojii = food.emoji!
                    exp = food.exp!
                    check = food.saved
                    
                }
        }.background(Color("gray"))
    }
}

