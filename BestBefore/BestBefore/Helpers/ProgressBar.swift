//  Gros
//
//  Created by Jude Alatawi on 17/06/1444 AH.
//

import SwiftUI

struct progressBar: View {
    @Binding var progress: Double
    
    var color: Color = Color("red")
    
    var body: some View {
        ZStack{
            Circle()
                .stroke(lineWidth: 12.0)
                .foregroundColor(Color("red"))
            Circle()
                .trim(from: 0.0, to: progress)
            
                .stroke(style: StrokeStyle(lineWidth: 12.0, lineJoin: .round))
                .foregroundColor(color)
                .rotationEffect(.degrees(-90))
        }
    }
}
