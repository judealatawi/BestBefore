//
//  SwiftUIViewtwo.swift
//  Best Before
//
//  Created by Jude Alatawi on 20/06/1444 AH.
//

import SwiftUI

struct SwiftUIViewtwo: View {
    var body: some View {
        List {
                   ForEach((1...100), id: \.self) {
                       Text("Row \($0)")
                           .listRowBackground(Color.pink)
                   }
                   // This also work
                   // .listRowBackground(Color.pink)
               }    }
}

struct SwiftUIViewtwo_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIViewtwo()
    }
}
