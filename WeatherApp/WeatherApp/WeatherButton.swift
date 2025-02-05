//
//  WeatherButton.swift
//  WeatherApp
//
//  Created by luna.henseler on 22/1/25.
//

import SwiftUI

struct weatherButton: View {
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor.gradient)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
    }
}

#Preview {
    weatherButton(title: "Button", textColor: .white, backgroundColor: .blue)
}
