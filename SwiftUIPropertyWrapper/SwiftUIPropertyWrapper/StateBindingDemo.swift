//
//  StateBindingDemo.swift
//  SwiftUIPropertyWrapper
//
//  Created by Changhao Li on 2021/12/9.
//

import SwiftUI

/**
 @State & @Binding
 提供 View 内部的状态存储
 应该是被标记为 private 的简单值类型，仅在内部使用。
 */
struct StateBindingDemo: View {

    @State private var foo: Bool = false

    var body: some View {
        VStack(spacing: 25) {
            Text("foo in Parent: \(foo ? "✔️" : "❌")")
            HelpChildView(foo: $foo)
        }
    }
}

struct HelpChildView: View {

    @Binding var foo: Bool

    var body: some View {
        Button("toggle foo from Child") {
            foo.toggle()
        }
    }
}

struct StateBinding_Previews: PreviewProvider {
    static var previews: some View {
        StateBindingDemo()
    }
}
