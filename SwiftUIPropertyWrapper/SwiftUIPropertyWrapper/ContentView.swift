//
//  ContentView.swift
//  SwiftUIPropertyWrapper
//
//  Created by Changhao Li on 2021/12/9.
//

import SwiftUI


/**
 View 与 View 间的公用数据使用 @State + @Binding。
 多个 View 与 Class 间的公用数据：对 View 用 @ObservedObject，让 Class 满足 ObservableObject 协议。
 父 View 与 子 View 对 Class 间的公用数据：父 View 用 @ObservedObject，子 View 用 @EnvironmentObject，Class 满足 ObservableObject 协议
 */
struct ContentView: View {

    @Temperature(celcius: 69) var templete

    private let model1 = Model()
    private let model2 = Model()

    var body: some View {
        VStack {
            Text("摄氏度:\(templete), K氏度:\($templete)")
            Spacer()
            StateBindingDemo()
            Spacer()
            EnvironmentObjectDemo()
                .environmentObject(model1)
            Spacer()
            ObservedObjectDemo(model: model2)
            Spacer()
            EnvironmentDemo()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

@propertyWrapper struct Temperature {
    var celcius = 35.0
    var wrappedValue: Double {
        get {
            return celcius
        }
        set {
            celcius = newValue
        }
    }

    var projectedValue: Double {
        return celcius + 273.15 // K氏度 = 摄氏度+ 273.15
    }
}
