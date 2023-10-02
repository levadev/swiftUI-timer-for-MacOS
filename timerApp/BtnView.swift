//
//  BtnView.swift
//  timerApp
//
//  Created by Дмитрий Андреевич on 14.9.23.
//  Copyright © 2023 app.levikaw. All rights reserved.
//

import SwiftUI

struct BtnView: View {
	
	//	btns params
	let btnSize: CGFloat = 45,
	btnPad: CGFloat = 4,
	btnCorner: CGFloat = 50,
	btnLW: CGFloat = 1,
	color: Color,
	text: String,
	function: () -> Void
	
	var font: Font = .caption,
	background: String
	
	var body: some View {
		Text(self.text)
			.fontWeight(.ultraLight)
			.font(font)
			.multilineTextAlignment(.center)
			.frame(width: (background == "rectangle" ? 100 : self.btnSize), height: self.btnSize)
			.background(RoundedRectangle(cornerRadius: self.btnCorner).fill(self.color))
			.padding(self.btnPad)
			.onHover{ inside in
				inside ? NSCursor.pointingHand.push() : NSCursor.pop()
		}
		.overlay(
			RoundedRectangle(cornerRadius: self.btnCorner)
				.stroke(self.color)
		)
			.onTapGesture{
				self.function()
		}
	}
}

struct BtnView_Previews: PreviewProvider {
	
	static var previews: some View {
		BtnView(color: Color.orange, text: "Stop", function: {
			print("stop timer")
		}, font: .title, background: "rectangle")
	}
}
