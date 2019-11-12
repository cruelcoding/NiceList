//
//  HeaderView.swift
//  NiceList
//


import SwiftUI

struct HeaderView : View {
    
    var section : SectionDataModel
    
    var body: some View {
        HStack() {
            Triangle()
                .fill(Color.black)
                .overlay(
                    Triangle()
                        .stroke(Color.red, lineWidth: 5)
            )
                .frame(width : 50, height : 50)
                .padding()
                .rotationEffect(.degrees(section.expanded ? 90 : 0), anchor: .init(x: 0.5, y: 0.5)).animation(.default)
            Spacer()
            Text(String(section.letter))
                .font(.largeTitle)
                .foregroundColor(Color.black)
            Spacer()
        }
        .background(Color.yellow)
    }
    
    struct Triangle : Shape {
        func path(in rect: CGRect) -> Path {
            var path = Path()
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: 0, y: rect.height - 1))
            path.addLine(to: CGPoint(x: sqrt(3)*(rect.height)/2, y: rect.height/2))
            path.closeSubpath()
            return path
        }
    }
    
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(section:  UserData().latinities[0])
    }
}
