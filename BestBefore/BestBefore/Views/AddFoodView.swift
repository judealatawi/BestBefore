//
//  ADd.swift
//  Gros
//
//  Created by Jude Alatawi on 17/06/1444 AH.
//

import SwiftUI
extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
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
                        TextField( "Product Name:", text: $name){UIApplication.shared.endEditing()}.padding().accessibilityLabel(Text("Text field to enter the Product Name")).colorScheme(.light)
                        
                    }
                    HStack{
                      
                        EmojiTextField(text: $emoji).colorScheme(.light)
                        .padding().accessibilityLabel(Text("Text field to enter the Product Emoji"))
                    }
                    VStack{
                        HStack{
                          Text("Expiration Date:")
                                .accessibilityLabel(Text("Calender to enter the Product Expiration date"))
                            Spacer()
                        }
                        DatePicker("",selection: $exp, in: Date()..., displayedComponents: .date).colorScheme(.light)
                            .font(.system(size: 15)).foregroundColor(.gray).datePickerStyle(.graphical)
                    }
                    
                }.listRowBackground(Color.white)
                
                Button {
                    DataController().addFood(name: name, context: managedObjContext, emoji: emoji, exp: exp)
                    NotificationManagerClass.instance.ScheduleNotification(date: exp,body: name)
                    dismes()
                } label: {
                    Text("Add")
                        .frame(maxWidth: .infinity,maxHeight: 39)
                        .font(.system(size: 24, weight: .regular, design: .rounded)).accessibilityLabel(Text("Add button"))
                    
                }.listRowBackground(Color.white).frame(maxWidth: .infinity)
                    .foregroundColor(.black)
                    .background(Color("green"))
                    .cornerRadius(8)
                
            }.scrollContentBackground(.hidden).foregroundColor(Color.black)
        }.background(Color("gray"))
    }
}

struct AddFoodView_Previews: PreviewProvider {
    static var previews: some View {
        AddFoodView()
    }
}
