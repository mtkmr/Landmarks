//
//  ModelData.swift
//  Landmarks
//
//  Created by Masato Takamura on 2021/11/16.
//

import Foundation
import Combine
//監視可能なオブジェクト(ObservableObject)をSwiftUIは監視し、データが変更されたときに更新が必要なビューを更新する

final class ModelData: ObservableObject {
    //監視可能なオブジェクトは、Subscriberが変更を取得できるように、データへの変更を公開する必要がある
    @Published var landmarks: [Landmark] = load("landmarkData.json")
    //Hikeデータを読み込んで、その後変更することがないので@Publisherを付けなくて良い
    var hikes: [Hike] = load("hikeData.json")

    @Published var profile = Profile.default

    var features: [Landmark] {
        landmarks.filter { $0.isFeatured }
    }

    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarks,
            by: { $0.category.rawValue }
        )
    }
}

///メインバンドルからJSONファイルをデコードして取得するメソッド
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }

}
