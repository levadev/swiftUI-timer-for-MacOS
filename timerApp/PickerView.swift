//
//  PickerView.swift
//  timerApp
//
//  Created by Дмитрий Андреевич on 1.10.23.
//  Copyright © 2023 app.levikaw. All rights reserved.
//

import SwiftUI

struct PickerView: View {
	var initArray: Array<Int>  = []
    @Binding public var selected: Int
	
    var body: some View {
        Picker(selection: $selected, label: EmptyView()){
			ForEach(initArray, id: \.self) { element in
				Text("\(element)").tag(element)
			}
		}.background(Color.black)
    }
}

//struct PickerView_Previews: PreviewProvider {
//    static var previews: some View {
//		PickerView(initArray: [0, 1, 2, 3, 4, 5, 6], selected: 0)
//    }
//}
