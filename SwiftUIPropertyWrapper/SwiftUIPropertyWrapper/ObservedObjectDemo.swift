//
//  ObservedObjectDemo.swift
//  SwiftUIPropertyWrapper
//
//  Created by Changhao Li on 2021/12/9.
//

import SwiftUI

/**
 ObservableObject & @ObservedObject
 针对跨越 View 层级的状态共享
 处理更复杂的数据类型，在数据变化时触发界面刷新。
 */
struct ObservedObjectDemo: View {

    @ObservedObject var model: Model

    var body: some View {
        VStack(spacing: 25) {
            Text("foo in Parent: \(model.foo ? "✔️" : "❌")")
            ProfileChildView(model: model)
        }
    }
}

struct ProfileChildView: View {
    var model: Model

    var body: some View {
        Button("toggle foo from Child") {
            model.foo.toggle()
        }
    }
}

struct ObservedObjectDemo_Previews: PreviewProvider {
    static var previews: some View {
        ObservedObjectDemo(model: Model())
    }
}
