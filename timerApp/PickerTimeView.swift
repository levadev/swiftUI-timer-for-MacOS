//
//  PickerTimeView.swift
//  timerApp
//
//  Created by Дмитрий Андреевич on 1.10.23.
//  Copyright © 2023 app.levikaw. All rights reserved.
//

import SwiftUI

struct PickerTimeView: View {
	@Binding public var minutes: Int
	@Binding public var hours: Int
	@Binding public var seconds: Int

    var body: some View {
			HStack {
				PickerView(initArray: [0, 1, 2, 3, 4, 5, 6], selected: $hours)
				Text(":")
				PickerView(initArray: [0, 5, 10, 20, 30, 40, 50], selected: $minutes)
				Text(":")
				PickerView(initArray: [0, 10, 20, 30, 40, 50], selected: $seconds)
			}.frame(width: 200, height: 50)
    }
}

//struct PickerTimeView_Previews: PreviewProvider {
//    static var previews: some View {
//		PickerTimeView()
//    }
//}
