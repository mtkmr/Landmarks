//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Masato Takamura on 2021/11/16.
//

import SwiftUI

struct LandmarkRow: View {

    var landmark: Landmark

    var body: some View {
        HStack {
            landmark.image
                .resizable() //Imageをリサイズするときはこれが必要
                .frame(width: 50, height: 50)
            Text(landmark.name)

            Spacer()

            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                    .padding()
            }
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {

    static var landmarks = ModelData().landmarks

    static var previews: some View {
        Group {
            LandmarkRow(landmark: landmarks[0])
            LandmarkRow(landmark: landmarks[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
