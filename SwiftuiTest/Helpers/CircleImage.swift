//
//  CircleImage.swift
//  SwiftuiTest
//
//  Created by 段峰 on 2020/12/15.
//

import SwiftUI

struct CircleImage: View {
    var image:Image
    
    var body: some View {
        image
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white,lineWidth: 4))
            .shadow(radius: 4)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("turtlerock"))
    }
}
