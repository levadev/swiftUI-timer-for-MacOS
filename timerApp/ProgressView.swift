//
//  ProgressView.swift
//  timerApp
//
//  Created by Дмитрий Андреевич on 14.9.23.
//  Copyright © 2023 app.levikaw. All rights reserved.
//

import SwiftUI

struct ProgressView: View {
	
	@Binding public var circleProgress: Double
	
	var body: some View {
			Group {
			// Gray circle
			Circle()
				.stroke(lineWidth: 8.0)
				.opacity(0.3)
				.foregroundColor(Color.gray)
			
			// Orange circle
			Circle()
				.trim(from: 0.0, to: CGFloat(circleProgress))
				.stroke(style: StrokeStyle(lineWidth: 8.0, lineCap: .round, lineJoin: .round))
				.foregroundColor(Color.orange)
				.rotationEffect(Angle(degrees: 270))
			
		}.frame(width: 250, height: 250)
		// progress animation every 1 second
		.animation( Animation.linear(duration: 1))
	}
}

//struct ProgressView_Previews: PreviewProvider {
//	static var previews: some View {
//		ProgressView(circleProgress: 0.6)
//	}
//}
