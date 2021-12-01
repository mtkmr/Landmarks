//
//  RotatedBadgeSymbol.swift
//  Landmarks
//
//  Created by Masato Takamura on 2021/11/23.
//

import SwiftUI

struct RotatedBadgeSymbol: View {

    let angle: Angle

    var body: some View {
        BadgeSymbol()
            .padding(-60)
            .rotationEffect(angle, anchor: .bottom)
    }
}

struct RotatedBadgeSymbol_Previews: PreviewProvider {
    static var previews: some View {
        RotatedBadgeSymbol(angle: Angle(degrees: 5))
    }
}
