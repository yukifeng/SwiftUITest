//
//  ContentView.swift
//  SwiftuiTest
//
//  Created by 段峰 on 2020/12/15.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

struct Widget:View {
    var body: some View{
        Text("hello, SwiftUI!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
