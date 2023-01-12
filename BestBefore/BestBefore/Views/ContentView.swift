//
//  ContentView.swift
//
//  Created by Jude Alatawi on 17/06/1444 AH.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var  managedObjContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.exp)]) var food : FetchedResults<Grosy>
    
    @State private var showAddView = false
    @State private var num = 0
    @State var progressValue: Double = 0.0
    
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading){
                Text("See your progress so far")
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .padding(.horizontal)
                
                
                HStack (alignment: .top){
                    
                    let saved : Double = totalsaved()
                    let failed : Double = totalfailed()
                    let progressVal : Double = saved / (saved + failed)
                    
                    
                    progressBar(progress: self.$progressValue, color: Color("green"))
                        .frame(width: 145.0, height: 145.0)
                        .padding(.horizontal).padding(5)
                        .onAppear() {
                            
                            self.progressValue = progressVal
                        }
                    
                    Spacer()
                    VStack{
                        
                        Rectangle()
                            .frame(maxWidth: .infinity,maxHeight: 33)
                            .overlay(){
                                Group{
                                    Text("Saved 🥳").accessibilityLabel(Text("Number of saved products ")) + Text("  \(Int(totalsaved()))")
                                }.lineLimit(2).foregroundColor(.black)
                                    .font(.system(size: 21, weight: .medium, design: .rounded))
                                
                            }
                            .cornerRadius(8.0)
                            .foregroundColor(Color("green"))
                        
                        Rectangle()
                            .frame(maxWidth: .infinity,maxHeight: 33)
                            .overlay(){
                                Group{
                                    Text("Expired 😔").accessibilityLabel(Text("Number of Expired products ")) + Text("\(Int(totalfailed()))")
                                    
                                }.lineLimit(2).foregroundColor(.black)
                                    .font(.system(size: 21, weight: .medium, design: .rounded))
                                
                            }
                            .foregroundColor(Color("red"))
                            .cornerRadius(8.0)
                    }.padding(.trailing)
                    
                }.padding(.horizontal,10)
                
                
                
                
                
                
                
                
                
                List {
                    
                    HStack{
                        
                        Button{
                            showAddView.toggle()
                        }label: {
                            Image(systemName: "plus").frame(width: 90,height: 88).background(Color("gray")).cornerRadius(21).font(.system(size: 48))
                                .foregroundColor(Color("brown"))
                        }
                        
                        
                        
                        
                        HStack{
                            VStack(alignment: .leading,spacing: 6){
                                Text("Add a New Product").accessibilityLabel(Text("Add a new product by clicking the plus sign"))
                                    .font(.system(size: 21, weight: .semibold, design: .rounded))
                                
                            }
                        }
                        Spacer()
                        
                    }.frame(maxWidth: .infinity ,maxHeight: 102)
                        .background(Color(.white))
                        .cornerRadius(21)
                    
                    ForEach(food){ f in
                        
                        let now = Date()
                        let dayAgo = now - 86400
                        let timeInterval = f.exp!.timeIntervalSince(dayAgo)/60/60/24
                        let n = Int(timeInterval)
                        if(f.saved == false && n >= num){
                            VStack{
                                HStack{
                                    NavigationLink(destination: EditFoodView(food : f)){
                                        Text(f.emoji!)
                                            .font(.system(size: 48))
                                            .frame(width: 90,height: 88)
                                            .background(Color("green"))
                                            .cornerRadius(21)
                                        //.padding(.vertical).padding(10)
                                        
                                        HStack{
                                            VStack(alignment: .leading,spacing: 6){
                                                Text(f.name!)
                                                    .font(.system(size: 21, weight: .semibold, design: .rounded))
                                                
                                                    .foregroundColor(.black)
                                                
                                                
                                                
                                                formate(no: n)
                                                    .foregroundColor(.gray)
                                            }
                                        }
                                        
                                    }
                                    
                                    Spacer()
                                    
                                    
                                    
                                }
                            }
                            
                        }
                        
                    }.onDelete(perform: deletFood)
                    
                    //Divider()
                    Text("Expired 😔:").accessibilityLabel(Text("expired products ")).foregroundColor(.black)
                        .font(.system(size: 21, weight: .semibold, design: .rounded))
                    ForEach(food){ f in
                        
                        let now = Date()
                        let dayAgo = now - 86400
                        let timeInterval = f.exp!.timeIntervalSince(dayAgo)/60/60/24
                        let n = Int(timeInterval)
                        if(f.saved == false && n < num ){
                            VStack{
                                HStack{
                                    NavigationLink(destination: EditFoodView(food : f)){
                                        Text(f.emoji!)
                                            .font(.system(size: 48))
                                            .frame(width: 90,height: 88)
                                            .cornerRadius(21)
                                        HStack{
                                            VStack(alignment: .leading,spacing: 6){
                                                Text(f.name!)
                                                    .foregroundColor(.black)
                                                    .font(.system(size: 21, weight: .semibold, design: .rounded))
                                                
                                                
                                                formate(no: n)
                                                    .foregroundColor(.gray)
                                            }
                                        }
                                        
                                    }
                                    
                                    Spacer()
                                    
                                    
                                    
                                }
                            }.background(Color("red")).opacity(0.4).cornerRadius(21)
                            
                        }
                        
                    }.onDelete(perform: deletFood)
                    
                    Text("Saved 🥳:").foregroundColor(.black)
                        .font(.system(size: 21, weight: .semibold, design: .rounded))
                    ForEach(food){ f in
                        
                        let now = Date()
                        let dayAgo = now - 86400
                        let timeInterval = f.exp!.timeIntervalSince(dayAgo)/60/60/24
                        let n = Int(timeInterval)
                        if(f.saved == true ){
                            VStack{
                                HStack{
                                    NavigationLink(destination: EditFoodView(food : f)){
                                        Text(f.emoji!)
                                            .font(.system(size: 48))
                                            .frame(width: 90,height: 88)
                                        //.background(Color("green"))
                                            .cornerRadius(21)
                                        //.padding(.vertical).padding(10)
                                        
                                        HStack{
                                            VStack(alignment: .leading,spacing: 6){
                                                Text(f.name!)
                                                    .foregroundColor(.black)
                                                    .font(.system(size: 21, weight: .semibold, design: .rounded))
                                                
                                                
                                                formate(no: n)
                                                    .foregroundColor(.gray)
                                            }
                                        }
                                        
                                    }
                                    
                                    Spacer()
                                    
                                    
                                    
                                }
                            }.background(Color("green")).opacity(0.4).cornerRadius(21)
                            
                        }
                        
                    }.onDelete(perform: deletFood)
                    
                }.cornerRadius(21)
                
            }.navigationTitle("Products")
            
                .accentColor(Color("green"))
                .toolbar{
                    ToolbarItem(placement: .navigationBarLeading){
                        EditButton()
                    }
                }.sheet(isPresented: $showAddView){
                    AddFoodView()
                }.background(Color("gray"))
            
        }.navigationViewStyle(.stack).accentColor(Color("brown"))
        
    }
    
    private func deletFood(offset: IndexSet){
        withAnimation{
            offset.map{food[$0]}.forEach(managedObjContext.delete)
            DataController().save(context: managedObjContext)
            
        }
        
    }
    
    func totalsaved() -> Double{
        var saved : Double = 0
        for item in food{
            if item.saved == true {
                saved += 1.0
            }
        }
        return saved
    }
    
    private func totalfailed() -> Double{
        var failed : Double = 0
        
        for item in food{
            let now = Date()
            let dayAgo = now - 86400
            let timeInterval = item.exp!.timeIntervalSince(dayAgo)/60/60/24
            let n = Int(timeInterval)
            
            if item.saved == false && n < num  {
                failed += 1.0
            }
        }
        return failed
    }
    
    private func formate(no : Int) -> Text{
        
        if no == 1 {
            return Text("\(no)") + Text(" day left").accessibilityLabel(Text("days left tell the product expire"))
        }else{
            return Text("\(no)")  + Text(" days left").accessibilityLabel(Text("days left tell the product expire"))
        }
        
    }
    
    
    
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
