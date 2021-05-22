//
//  File.swift
//  Parcel Reservation
//
//  Created by 孙世伟 on 2020/11/19.
//

import Foundation
import SwiftUI

// custom Shape...

struct CShape : Shape {
    
    func path(in rect: CGRect) -> Path {

        return Path{path in
            
            // starting from bottom...
            
            path.move(to: CGPoint(x: rect.width, y: rect.height - 50))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: 0, y: rect.height - 50))
            
            // adding curve...
            
            // total raidus of curve = 80
            path.addArc(center: CGPoint(x: rect.width - 40, y: rect.height - 50), radius: 40, startAngle: .zero, endAngle: .init(degrees: 180), clockwise: false)
        }
    }
}
