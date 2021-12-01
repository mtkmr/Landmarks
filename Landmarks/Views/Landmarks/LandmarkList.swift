//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Masato Takamura on 2021/11/16.
//

import SwiftUI

struct LandmarkList: View {

    //@EnvironmentObject 複数で共通のオブジェクトを参照する
    // -> アプリ全体で、共通のオブジェクトを参照できる
    //例えば、データバインディングしていると、そのオブジェクトを参照する全てのビューが更新される
    @EnvironmentObject var modelData: ModelData

    @State private var showFavoriteOnly: Bool = false

    //showFavoriteOnly = true -> landmarksの中で、isFavoriteがtrueのものだけ通す。
    //showFavorite = false -> landmarksの全てを通す。
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            !showFavoriteOnly || landmark.isFavorite
        }
    }

    var body: some View {
        //データのコレクションと、コレクション内の各要素のビューを提供するクロージャをListに渡す。Listはクロージャを使用してコレクション内の各要素を子ビューに変換する
        //LandmarkにIdentifiableに準拠させることで、idというプロパティを持っていることを示すプロトコルに準拠したことになるので、landmarksを直接Listのイニシャライザの引数に渡すことができる。
        NavigationView {
            List {

                //Toggleをリストの上に配置して、showFavoriteOnlyにバインディングを渡す (SwiftUIではデフォルトで参照にバインディングを渡してくれる)
                Toggle(
                    isOn: $showFavoriteOnly,
                    label: {
                        Text("Favorite only")
                    }
                )

                //リスト内に動的なコンポーネントを含む２つ以上のビューを組み合わせて並べるには、ForEachを使用する
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink(
                        destination: {
                            LandmarkDetail(landmark: landmark)
                        },
                        label: {
                            LandmarkRow(landmark: landmark)
                        }
                    )
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}


struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
//        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max", "iPad Pro (12.9-inch) (5th generation)"], id: \.self) { deviceName in
//            LandmarkList()
//                .previewDevice(PreviewDevice(rawValue: deviceName))
//                .previewDisplayName(deviceName)
//        }
        LandmarkList()
            .environmentObject(ModelData())
    }
}
