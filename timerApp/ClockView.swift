//
//  ClockView.swift
//  timerApp
//
//  Created by Дмитрий Андреевич on 14.9.23.
//  Copyright © 2023 app.levikaw. All rights reserved.
//

import SwiftUI

struct ClockView: View {
	
	var timeProgress: String,
	globalWidth: CGFloat,
	isTimerActive: Bool
	
	@Binding public var minutes: Int
	@Binding public var hours: Int
	@Binding public var seconds: Int
	
	@Binding public var circleProgress: Double
	
	var body: some View {
		ZStack {
			ProgressView(circleProgress: $circleProgress)
			if (isTimerActive) {
				// timer
				Text(self.timeProgress)
					.font(.system(size: 50))
					.fontWeight(.ultraLight)
					.frame(width: 200, height: 50)
			} else {
					PickerTimeView(minutes: $minutes, hours: $hours, seconds: $seconds)
			}
		}.frame(width: self.globalWidth, height: 300)
	}
}

//struct ClockView_Previews: PreviewProvider {
//	static var previews: some View {
//		ClockView(circleProgress: 0.6, timeProgress: "00:00:01", globalWidth: 300, isTimerActive: false)
//	}
//}
