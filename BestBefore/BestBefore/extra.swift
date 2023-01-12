////
////  SwiftUIView.swift
////  Gros
////
////  Created by Jude Alatawi on 15/06/1444 AH.
////
//
//import SwiftUI
//import CTScanText
//
//struct SwiftUIView: View {
//    @State private var SacnneDdate = ""
//    @State private var name = ""
//    @State private var date = ""
//    @State private var emoji = ""
//    
//    var body: some View {
//        VStack{
//            
//            
//            Form{
//                
//                Section(header: Text("Product Information").font(.custom("SF Pro Rounded", size: 21))) {
//                    TextField("Product",text: $name)
//                    .padding().font(.custom("SF Pro Rounded", size: 21)).fontWeight(.semibold)}.padding(.top,5)
//                
//                
//                Section(header: Text("Emoji").font(.custom("SF Pro Rounded", size: 21))) {
//                    EmojiTextField(text: $emoji, placeholder: "Optinal").padding().font(.custom("SF Pro Rounded", size: 21)).fontWeight(.semibold)
//                    
//                }
//                
//                
//                Section(header: Text("Expiration Date").font(.custom("SF Pro Rounded", size: 21))) {
//                    
//                    
//                    ScanTextField("Tap to scan", text: $date)
//                    .textContentType(.dateTime).padding().font(.custom("SF Pro Rounded", size: 21)).fontWeight(.semibold)}
//                
//                //                Button {
//                //
//                //                                   } label: {
//                //                                       Text("ADD")
//                //
//                //                                   }.buttonStyle(BorderlessButtonStyle())
//                //
//                
//            }.foregroundColor(Color.black)
//            //.padding(.top,50)
//            //.background(Color.purple)
//            // .scrollContentBackground(.hidden)
//            
//            //Spacer()
//            Button {
//                
//            } label: {
//                Text("ADD")
//            }.frame(width: 50,height: 50)
//            .padding(.bottom,80)
//            
//            
//        }
//        
//    }
//}
//
//struct SwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        SwiftUIView()
//    }
//}
//
//class UIEmojiTextField: UITextField {
//    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//    }
//    
//    func setEmoji() {
//        _ = self.textInputMode
//    }
//    
//    override var textInputContextIdentifier: String? {
//        return ""
//    }
//    
//    override var textInputMode: UITextInputMode? {
//        for mode in UITextInputMode.activeInputModes {
//            if mode.primaryLanguage == "emoji" {
//                self.keyboardType = .default // do not remove this
//                return mode
//            }
//        }
//        return nil
//    }
//}
//
//struct EmojiTextField: UIViewRepresentable {
//    @Binding var text: String
//    var placeholder: String = ""
//    
//    func makeUIView(context: Context) -> UIEmojiTextField {
//        let emojiTextField = UIEmojiTextField()
//        emojiTextField.placeholder = placeholder
//        emojiTextField.text = text
//        emojiTextField.delegate = context.coordinator
//        return emojiTextField
//    }
//    
//    func updateUIView(_ uiView: UIEmojiTextField, context: Context) {
//        uiView.text = text
//    }
//    
//    func makeCoordinator() -> Coordinator {
//        Coordinator(parent: self)
//    }
//    
//    class Coordinator: NSObject, UITextFieldDelegate {
//        var parent: EmojiTextField
//        
//        init(parent: EmojiTextField) {
//            self.parent = parent
//        }
//        
//        func textFieldDidChangeSelection(_ textField: UITextField) {
//            DispatchQueue.main.async { [weak self] in
//                self?.parent.text = textField.text ?? ""
//            }
//        }
//    }
//}
//
////struct EmojiContentView: View {
////
////    @State private var text: String = ""
////
////    var body: some View {
////        EmojiTextField(text: $text, placeholder: "Enter emoji")
////    }
////}
//
//
//
//
//
//
//
////
////
////Section(header: Text("Product Information")) {
////    HStack{
////        Text("Poduct name").font(.custom("SF Pro Rounded", size: 21)).fontWeight(.semibold)
////        TextField(
////            "Product",
////            text: $name
////        ).padding().padding(.leading,10).font(.custom("SF Pro Rounded", size: 21)).fontWeight(.light)
////    }
////
////    HStack{
////        Text("Emoji").font(.custom("SF Pro Rounded", size: 21)).fontWeight(.semibold)
////        TextField(
////            "Optinal",
////            text: $emoji
////        ).padding().padding(.leading,70)
////    }
////
////    HStack{
////        Text("Expiration Date").font(.custom("SF Pro Rounded", size: 21)).fontWeight(.semibold)
////        TextField(
////            "Expiration Date",
////            text: $date
////        ).padding()
////    }
////
////}
//
//
//
//
//
//
//
//
//
//
//
//
//
//
////
////Section(header: Text("Product Information").font(.custom("SF Pro Rounded", size: 21))) {
////    HStack{
////
////        TextField(
////            "Product",
////            text: $name
////        ).padding().font(.custom("SF Pro Rounded", size: 21)).fontWeight(.semibold)
////    }
////
////    HStack{
////
////        TextField(
////            "Optinal",
////            text: $emoji
////        ).padding().font(.custom("SF Pro Rounded", size: 21)).fontWeight(.semibold)
////    }
////
////    HStack{
////
////        TextField(
////            "Expiration Date: DD/MM/YYYY",
////            text: $date
////        ).padding().font(.custom("SF Pro Rounded", size: 21)).fontWeight(.semibold)
////    }
////
////}
