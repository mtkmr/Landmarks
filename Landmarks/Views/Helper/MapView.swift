//
//  MapView.swift
//  Landmarks
//
//  Created by Masato Takamura on 2021/11/16.
//

import SwiftUI
import MapKit

struct MapView: View {

    var coordinate: CLLocationCoordinate2D

    @State var region = MKCoordinateRegion()

    //@Stateは、通常struct内のプロパティは変更できないが、メモリ管理をSwiftUIフレームワークに委譲することにより、変更可能とする。プロパティの値の変更は監視され、変更時に宣言されたビューのbodyが再描画される。変更時に、アクセスできるのは、宣言されたView内でのみ。また、値が変更されるアクセスでは$をつける必要あり。$をつけると、元になる値への参照をバインディングで渡す。


    var body: some View {
        Map(coordinateRegion: $region)
            .onAppear {
                //.onAppearはViewが初めて表示されるときに呼ばれる
                setRegion(coordinate)
            }
    }

    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
    }
}
