//
//  LandmarkDetail.swift
//  SwiftuiTest
//
//  Created by 段峰 on 2021/2/15.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var modelData: ModelData
    
    var landmark : Landmark
    var landmarkIndex: Int{
        modelData.landmarks.firstIndex { (land) -> Bool in
            land.id == landmark.id
        }!
    }
    
    
    var body: some View {
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                .frame(height: 300)
                .ignoresSafeArea( edges: .top)
            CircleImage(image: landmark.image)
                .offset(y:-130)
                .padding(.bottom,-130)
            VStack(alignment: .leading) {
                HStack{
                    Text(landmark.name)
                        .font(.title)
                        .foregroundColor(.primary)
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            .padding()
            Spacer()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetail_Previews:PreviewProvider {
    static var previews: some View{
        LandmarkDetail(landmark: ModelData().landmarks[0])
    }
}
