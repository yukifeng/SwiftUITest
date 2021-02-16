//
//  BadgeBackground.swift
//  SwiftuiTest
//
//  Created by 段峰 on 2021/2/16.
//

import SwiftUI

struct BadgeBackground: View {
    var body: some View {
        GeometryReader{ geometry in
            Path({ path in
                var width:CGFloat = min(geometry.size.width, geometry.size.height)
                let height = width
                let xScale:CGFloat = 0.832
                let xOffset = (width * (1.0 - xScale)) / 2.0
                width *= xScale
                path.move(
                    to: CGPoint(x: width * 0.95 + xOffset,
                                y: height * (0.20 + HexagonParameters.adjustment)
                                )
                )
                HexagonParameters.segements.forEach { (segement) in
                    path.addLine(
                        to: CGPoint(
                            x: width * segement.line.x + xOffset,
                            y: height * segement.line.y
                        )
                    )
                    path.addQuadCurve(
                        to: CGPoint(
                            x: width * segement.curve.x + xOffset,
                            y: height * segement.curve.y
                        ),
                        control: CGPoint(
                            x: width * segement.control.x + xOffset,
                            y: height * segement.control.y
                        )
                    )
                }
            }).fill(LinearGradient(
                        gradient: Gradient(colors: [Self.gradientStart, Self.gradientEnd]),
                        startPoint: UnitPoint(x: 0.5, y: 0),
                        endPoint: UnitPoint(x: 0.5, y: 0.6)))
        }
        .aspectRatio(1, contentMode: .fit)
    }
    static let gradientStart = Color(red: 239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)
        static let gradientEnd = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)
}

struct BadgeBackground_Previews: PreviewProvider {
    static var previews: some View {
        BadgeBackground()
    }
}
