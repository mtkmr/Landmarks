//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Masato Takamura on 2021/11/15.
//

import SwiftUI

//SwiftUIのLifeCycle
@main
struct LandmarksApp: App {

    //一度だけ初期化され、modelDataの中身はビューが更新されても保持される
    @StateObject var modelData = ModelData()

    var body: some Scene {
        WindowGroup {
            //シミュレーターまたはデバイスでアプリを実行するときにモデルオブジェクトをenvironmentObjectに配置
            ContentView()
                .environmentObject(modelData)
        }
    }
}
