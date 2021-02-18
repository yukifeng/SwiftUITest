//
//  ContentView.swift
//  SwiftuiTest
//
//  Created by 段峰 on 2020/12/15.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .featured
    
    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
        TabView(selection: $selection,
                content:  {
                    CategoryHome()
                        .tabItem {
                            Label("Featured", systemImage: "star")
                        }
                        .tag(Tab.featured)
                    LandmarkList()
                        .tabItem {
                            Label("List", systemImage: "list.bullet")
                        }
                        .tag(Tab.list)
                })
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
            .environmentObject(ModelData())
    }
}
