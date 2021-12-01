//
//  ContentView.swift
//  Landmarks
//
//  Created by Masato Takamura on 2021/11/15.
//

import SwiftUI

//デフォルトでは、SwiftUIのビューファイルは２つの構造体を宣言する。

//ビューのコンテンツとレイアウトを記述する
struct ContentView: View {

    @State private var selection: Tab = .featured

    enum Tab {
        case featured
        case list
    }

    var body: some View {
        TabView(selection: $selection) {
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
        }
    }
}

//ビューのプレビュー
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
