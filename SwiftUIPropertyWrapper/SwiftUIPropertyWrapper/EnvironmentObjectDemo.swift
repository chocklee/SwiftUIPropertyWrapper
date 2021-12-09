//
//  EnvironmentObjectDemo.swift
//  SwiftUIPropertyWrapper
//
//  Created by Changhao Li on 2021/12/9.
//

import SwiftUI

/**
 @EnvironmentObjectDemo
 对于 “跳跃式” 跨越多个 View 层级的状态
 更方便地使用 ObservableObject，以简化代码
 */
struct EnvironmentObjectDemo: View {

    @EnvironmentObject var model: Model

    var body: some View {
        VStack(spacing: 25) {
            Text("foo in Parent: \(model.foo ? "✔️" : "❌")")
            EnvironmentObjectChildView()
        }
    }
}

struct EnvironmentObjectChildView: View {
    @EnvironmentObject var model: Model

    var body: some View {
        Button("toggle foo from Child") {
           model.foo.toggle()
       }
    }
}

struct EnvironmentObject_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentObjectDemo()
            .environmentObject(Model())
    }
}
