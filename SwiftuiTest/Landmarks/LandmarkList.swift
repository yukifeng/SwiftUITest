//
//  LandmarkList.swift
//  SwiftuiTest
//
//  Created by 段峰 on 2021/2/14.
//

import SwiftUI

struct LandmarkList:View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { (landmark) -> Bool in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    var body: some View{
        NavigationView{
            List{
                Toggle(isOn: $showFavoritesOnly){
                    Text("Favorites only")
                }
                ForEach(filteredLandmarks){ landmark in
                    NavigationLink(
                        destination: LandmarkDetail(landmark: landmark)){
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews : PreviewProvider {
    static var previews:some View {
        ForEach(["iPhone SE (2nd generation)","iPhone XS Max"],id: \.self) { deviceName in
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
        }
    }
}
