//  Gros
//
//  Created by Jude Alatawi on 17/06/1444 AH.
//
import SwiftUI

struct OnBording: View {
    @AppStorage("currentPage") var currentPage = 1
    var body: some View {
        if currentPage > totalPages {
            ContentView()
        }else{
            WalkthroughScreen()
        }
        
    }
}
struct OnBording_Previews: PreviewProvider {
    static var previews: some View {
        OnBording()
    }
}
struct WalkthroughScreen: View{
    @AppStorage("currentPage") var currentPage = 1
    var body: some View{
        ZStack{
            
            if currentPage == 1 {
                ScreenView(image: "bag", title: "Welcome", detail: "Do you find it difficult to remember to consume products before they expire?", bgColor: Color("green"))
                    .transition(.scale)
            }
            
            if currentPage == 2 {
                ScreenView(image: "onb", title: "Add", detail: "To add a new product with an expiry date, just click the + button.", bgColor: Color("green"))
                    .transition(.scale)
            }
            
            if currentPage == 3 {
                ScreenView(image: "onb2", title: "Set back and Relax", detail: "When an item is about to expire, our app will notify you.", bgColor: Color("green"))
                    .transition(.scale)
                
            }
            
        }.onAppear{
         
        }
        
            .overlay(
                
                Button(action: {
                    //changing views
                    withAnimation(.easeInOut){
                        //checking
                        if currentPage <= totalPages{
                            currentPage += 1
                            
                        }
                        else{
                            currentPage = 1
                        }
                    }
                    
                }, label: {
                    Image(systemName: "chevron.right").font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.black)
                        .frame(width: 60, height: 60)
                        .background(Color.white)
                        .clipShape(Circle())
                        .overlay(
                            ZStack{
                                Circle().stroke(Color.black.opacity(0.04), lineWidth: 4)
                                
                                Circle().trim(from: 0, to: CGFloat(currentPage)/CGFloat(totalPages))
                                    .stroke(Color.white,lineWidth: 4)
                                    .rotationEffect(.init(degrees: -90))
                            }
                                .padding(-15)
                        )
                })
                .padding(.bottom,20)
                ,alignment: .bottom
            )
    }
}


struct ScreenView: View {
    var image: String
    var title: String
    var detail: String
    var bgColor: Color
    
    @AppStorage("currentPage") var currentPage = 1
    
    
    var body: some View {
        NavigationView{
            VStack(spacing: 20){
                HStack{
                    if currentPage == 1{
                        Text("")
                            .foregroundColor(.black)
                            .font(.title)
                            .fontWeight(.semibold)
                            .kerning(1.4).padding()
                    }
                    else{
                        Button(action: {
                            withAnimation(.easeInOut){
                                currentPage -= 1
                            }
                            
                        }, label: {
                            Image(systemName: "chevron.left")
                                .foregroundColor(.white)
                                .padding(.vertical,10)
                                .padding(.horizontal)
                                .background(Color.black.opacity(0.4))
                                .cornerRadius(10)
                        })
                    }
                    
                    
                    Spacer()
                    NavigationLink(destination:ContentView()) {
                        Button(action: {
                            withAnimation(.easeInOut){
                                currentPage = 4
                            }
                        }, label: {
                            Text("Skip")
                            .fontWeight(.semibold).foregroundColor(.black)                                  }
                               
                        )
                    }
                    
                }.foregroundColor(.white)
                    .padding()
                
                Spacer()
                Image(image)
                    .resizable().cornerRadius(21).aspectRatio(contentMode: .fit).padding()
                Text(title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black).padding(.top)
                
                Text(detail).font(.system(size: 26)).foregroundColor(.black).fontWeight(.medium).kerning(1.3).multilineTextAlignment(.center).padding(.horizontal)
                
                Spacer(minLength: 120)
                
            }
            .background(bgColor.cornerRadius(15).ignoresSafeArea())}
    }
}

var totalPages = 3
