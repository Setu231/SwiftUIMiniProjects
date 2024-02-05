//
//  WeatherAppView.swift
//  SwiftUIMiniProjects
//
//  Created by Setu Desai on 1/22/24.
//

import SwiftUI
import CoreData


struct WeatherAppView: View {
   
    @State var isNight = false
    var body: some View {
        ZStack {
                BackgroundView(isNight: $isNight)
            VStack(spacing: 40) {
                LayerOnBackgroundView()
                Spacer()
                Button {
                    isNight.toggle()
                } label: {
                    Text("Change to Day/Night")
                        .font(.title2)
                        .fontWeight(.medium)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .frame(width: 280, height: 50)
                        .background(Color(hue: 1.0, saturation: 0.07, brightness: 0.74))
                        .cornerRadius(10)
                }
                Spacer()
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct WeatherDaysView: View {
    @State var weatherImage: Image
    @State var temperature: Text
    
    init(weatherImage: String?, temperature: String?) {
        self.weatherImage = Image(systemName: weatherImage ?? "sun.min")
        self.temperature = Text(temperature ?? "-")
    }
    
    var body: some View {
        VStack {
            weatherImage
                .renderingMode(.original)
                .resizable()
                .customStyle(width: 40, height: 40)
                .foregroundColor(.white)
            
            temperature
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(width: 35, height: 35)
        }
    }
}

struct WeatherTitleView: View {
    @State var weatherImage: Image
    @State var temperature: Text
    
    init(weatherImage: String?, temperature: String?) {
        self.weatherImage = Image(systemName: weatherImage ?? "sun.min")
        self.temperature = Text(temperature ?? "-")
    }
    
    var body: some View {
        VStack(spacing: 20) {
            weatherImage
                .renderingMode(.original)
                .resizable()
                .customStyle(width: 120, height: 120)
                .foregroundColor(.white)
            
            temperature
                .font(.system(size: 40, weight: .medium, design: .default))
                .fontWeight(.heavy)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .frame(width: 80, height: 80)
        }
    }
}

struct BackgroundView: View {
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(colors: isNight ? [.gray, .black] : [.blue, .gray],
                       startPoint: .top,
                       endPoint: .bottom)
            .ignoresSafeArea()
        
//        //Can also use
//        ContainerRelativeShape()
//            .fill(.black.gradient)
//            .ignoresSafeArea()
    }
}

struct LayerOnBackgroundView: View {
    
    var body: some View {
        TitleView()
        WeatherTitleView(weatherImage: "cloud.snow", temperature: "-4°")
        Spacer()
        HStack(spacing: 30) {
            WeatherDaysView(weatherImage: "cloud.snow", temperature: "-4°")
            WeatherDaysView(weatherImage: "wind", temperature: "3°")
            WeatherDaysView(weatherImage: "snowflake", temperature: "0°")
            WeatherDaysView(weatherImage: "cloud.hail", temperature: "-8°")
            WeatherDaysView(weatherImage: "cloud.snow", temperature: "-1°")
            
        }
    }
}

struct TitleView: View {
    
    var body: some View {
        Text("Irving, TX")
            .font(.largeTitle)
            .fontWeight(.heavy)
            .foregroundColor(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherAppView()
    }
}
