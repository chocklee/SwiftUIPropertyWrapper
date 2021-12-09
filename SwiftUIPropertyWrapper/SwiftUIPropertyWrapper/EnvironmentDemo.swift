//
//  EnvironmentDemo.swift
//  SwiftUIPropertyWrapper
//
//  Created by Changhao Li on 2021/12/9.
//

import SwiftUI

struct EnvironmentDemo: View {
    // SwiftUI 本身就很多系统级别的设定，我们开一个通过 @Environment 来获取到它们
    // @Environment 修饰的属性，我们开一个监听系统级别信息的变换
    @Environment(\.editMode) var editMode

    var body: some View {
        EditButton()
        if editMode?.wrappedValue == .active {
            Text("active")
        } else {
            Text("inactive")
        }
    }
}

struct EnvironmentDemo_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentDemo()
    }
}
