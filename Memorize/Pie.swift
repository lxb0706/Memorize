//
//  Pie.swift
//  Memorize
//
//  Created by lxb on 2021/12/14.
//

import SwiftUI

struct Pie: Shape {

    
    var startAngle: Angle
    var endAngle: Angle
    var clockwise = false
    
    func path(in rect: CGRect) -> Path {
     
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let raduis = min(rect.width, rect.height) / 2
        let start = CGPoint(
            x: center.x + raduis * CGFloat(cos(startAngle.radians)),
            y: center.y + raduis + CGFloat(sin(startAngle.radians))
        )
        
        var p = Path()
        p.move(to: center)
        p.addLine(to: start)
        p.addArc(center: center, radius: raduis, startAngle: startAngle, endAngle: endAngle, clockwise: !clockwise)
        p.addLine(to: center)
        return p
    }
    
}
