//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by Masato Takamura on 2021/11/17.
//

import SwiftUI

struct FavoriteButton: View {

    @Binding var isSet: Bool

    var body: some View {
        Button(
            action: {
                isSet.toggle()
        },
            label: {
                Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                    .labelStyle(.iconOnly)
                    .foregroundColor(isSet ? .yellow : .gray)
            }
        )
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
