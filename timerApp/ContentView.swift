//
//  ContentView.swift
//  timerApp
//
//  Created by Дмитрий Андреевич on 15.8.23.
//  Copyright © 2023 app.levikaw. All rights reserved.
//

import SwiftUI
import AppKit
import AVFoundation
import Cocoa

struct ContentView: View {
	
	// state for btn colors&disable
	@State private var isTimerActive: Bool = false
	
	// progress for animation
	@State var circleProgress: Double = 0.0
	
	// text for time progress
	@State private var timeProgress: String = ""
	
	// for cancel screen after timer is done
	@State private var timerIsDone: Bool = false
	
	
	@State var inputMin: Int = 10
	@State var inputHour: Int = 0
	@State var inputSec: Int = 0

	
	let globalWidth: CGFloat = 300
	
	// player for timer sound
	let player = NSSound(contentsOf: Bundle.main.url(forResource: "timer", withExtension: "mp3")!, byReference: true)
	
	var body: some View {
		
		ZStack {
			Rectangle().colorMultiply(Color.black)
			if self.timerIsDone {
				BtnView(color: Color.orange, text: "Stop", function: self.stopTimer, font: .title, background: "rectangle")
					.onAppear {
						self.player?.play()
						AudioServicesPlayAlertSound(kSystemSoundID_FlashScreen)
				}
			} else {
				VStack {
					ClockView(
						timeProgress: self.timeProgress,
						globalWidth: self.globalWidth,
						isTimerActive: self.isTimerActive,
						minutes: $inputMin,
						hours: $inputHour,
						seconds: $inputSec,
						circleProgress: $circleProgress
					)
					
					HStack  {
						BtnView(color: (self.isTimerActive ? Color.gray : Color.orange), text: "Start", function: self.startTimer, background: "circle")
						
						Spacer()
						
						BtnView(color: (self.isTimerActive ? Color.orange : Color.gray), text: "Cancel", function: self.cancelTimer, background: "circle")
					}.frame(width: 250, height: 70)
				}
			}
		}.frame(width: self.globalWidth, height: 400)
	}
	
	
	func startTimer() -> Void {
		if (!self.isTimerActive) {
			
			self.isTimerActive = true
			
			// total time in seconds
			var totalTime: Int = self.inputSec + (self.inputMin * 60) + (self.inputHour * 60 * 60)
			
			// constant for progress step from 0 to 1
			let progressStep: Double = 1 / Double(totalTime)
			
			// set timeProgress on start
			let formatHour: String = String(inputHour).count > 1 ? String(inputHour) : "0\(inputHour)",
			formatMin: String = String(inputMin).count > 1 ? String(inputMin) : "0\(inputMin)",
			formatSec: String = String(self.inputSec).count > 1 ? String(self.inputSec) : "0\(self.inputSec)"
			
			self.timeProgress = "\(formatHour):\(formatMin):\(formatSec)"

			// every 1 second timer
			Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
				if totalTime == 0 {
					
					self.timerIsDone = true
					
					self.isTimerActive = false
					self.circleProgress = 0
					
					timer.invalidate()
					
				} else {
					
					if !self.isTimerActive {
						timer.invalidate()
					} else {
						totalTime -= 1
						
						self.circleProgress += progressStep
						
						
						let seconds: String = "\(totalTime % 60)",
						minutes: String = "\(totalTime / 60 % 60)",
						hour: String = "\(totalTime / 60 / 60 % 60)"
						
						
						let formatSec: String = seconds.count > 1 ? seconds : "0\(seconds)",
						formatMin: String = minutes.count > 1 ? minutes : "0\(minutes)",
						formatHour: String = hour.count > 1 ? hour : "0\(hour)"
						
						self.timeProgress = "\(formatHour):\(formatMin):\(formatSec)"
						
					}
					
				}
				
			}
		}
	}
	
	func cancelTimer() -> Void {
		if (self.isTimerActive) {
			self.circleProgress = 0
			self.isTimerActive = false
		}
	}
	
	func stopTimer() -> Void {
		if self.player!.isPlaying {
			self.player?.stop()
			self.timerIsDone = false
		}
	}
	
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
