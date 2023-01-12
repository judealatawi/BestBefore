//
//  ADd.swift
//  Gros
//
//  Created by Jude Alatawi on 17/06/1444 AH.
//

import SwiftUI

struct AddFoodView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismes
    
    @State private var name = ""
    @State private var emoji = ""
    @State private var exp = Date()
    
    
    var body: some View {
        
        VStack{
            HStack{
                Spacer()
                Button {
                    dismes()
                } label: {
                    Image(systemName: "arrow.down.to.line").accessibilityLabel(Text("Go back to product page"))
                        .font(.custom("SF Pro Rounded", size: 24))
                        .fontWeight(.regular)
                }.foregroundColor(.black).padding(.horizontal)
            }.padding()
            
            
            Form{
                Section(header: Text("Product Information").font(.system(size: 24, weight: .semibold, design: .rounded))) {
                    HStack{
                        Text("Product Name:").font(.system(size: 24, weight: .regular, design: .rounded))
                        TextField( "", text: $name).padding().accessibilityLabel(Text("Text field to enter the Product Name"))
                        
                    }
                    HStack{
                        Text("Product Emoji:").font(.system(size: 24, weight: .regular, design: .rounded))
                        EmojiTextField(text: $emoji, placeholder: "").padding().accessibilityLabel(Text("Text field to enter the Product Emoji"))
                    }
                    VStack{
                        HStack{
                            Text("Expiration Date:").font(.system(size: 24, weight: .regular, design: .rounded)).accessibilityLabel(Text("Calender to enter the Product Expiration date"))
                            Spacer()
                        }
                        DatePicker("",selection: $exp, in: Date()..., displayedComponents: .date)
                            .font(.system(size: 15)).foregroundColor(.gray).datePickerStyle(.graphical)
                    }
                    
                }
                
                Button {
                    DataController().addFood(name: name, context: managedObjContext, emoji: emoji, exp: exp)
                    dismes()
                } label: {
                    Text("Add")
                        .frame(maxWidth: .infinity,maxHeight: 39)
                        .font(.system(size: 24, weight: .regular, design: .rounded)).accessibilityLabel(Text("Add button"))
                    
                }.frame(maxWidth: .infinity)
                    .foregroundColor(.black)
                    .background(Color("green"))
                    .cornerRadius(8)
                
            }.foregroundColor(Color.black)
        }.background(Color("gray"))
    }
}

struct AddFoodView_Previews: PreviewProvider {
    static var previews: some View {
        AddFoodView()
    }
}
