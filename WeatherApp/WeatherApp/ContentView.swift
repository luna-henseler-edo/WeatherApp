//
//  ContentView.swift
//  WeatherApp
//
//  Created by luna.henseler on 21/1/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            
            VStack() {
                CityTextView(cityName: "Cupertino, CA")
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" :"cloud.sun.fill", temperature: 76)
                
                HStack{
                    dayWeather(dayOfWeek: "TUE",
                               icon: "cloud.sun.fill",
                               temperature: 73, isNight: isNight)
                    dayWeather(dayOfWeek: "WED",
                               icon: "cloud.snow.fill",
                               temperature: 78, isNight: isNight)
                    dayWeather(dayOfWeek: "THU",
                               icon: "sun.rain.fill",
                               temperature: 57, isNight: isNight)
                    dayWeather(dayOfWeek: "FRI",
                               icon: "cloud.moon.fill",
                               temperature: 89, isNight: isNight)
                    dayWeather(dayOfWeek: "SAT",
                               icon: "sparkles",
                               temperature: 40, isNight: isNight)
                }
                Spacer()
                
                Button{
                    isNight.toggle()
                } label: {
                    weatherButton(title: "Change Day Time", textColor: isNight ? .black: .white, backgroundColor: isNight ? .white: .yellow)
                }
                
               Spacer()
                
            }
            .padding(5)
        }
       
    }
}


#Preview {
    ContentView()
}


struct BackgroundView: View {
    
    var isNight: Bool
    
    var body: some View {
       LinearGradient(gradient: Gradient(colors: [isNight ? .black :.blue,
                                                   isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea()
 }
}


struct dayWeather: View {
    var dayOfWeek: String
    var icon: String
    var temperature: Int
    var isNight: Bool
    
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .foregroundColor(.white)
                .font(.system(size:20, weight: .medium))
            
            Image(systemName: icon)
                .symbolRenderingMode(.palette)
                .resizable()
                .foregroundStyle(.white, isNight ? .gray: .yellow)
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 40)
                .padding(.vertical, 5)
            
            Text("\(temperature)º")
                .foregroundColor(.white)
                .font(.system(size:25, weight: .bold))
        }.padding(6)
        
    }
}


struct CityTextView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}


struct MainWeatherStatusView: View {
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:180, height:180)
            
            Text("\(temperature)°F")
                .font(.system(size:70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}


