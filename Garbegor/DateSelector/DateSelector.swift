//
//  DateSelector.swift
//  Garbegor
//
//  Created by Ignas Davulis on 2024-01-05.
//

import SwiftUI

struct DateSelector: View {
    @Binding var hourSelection: Date
    
    var body: some View {
        DatePicker("Hour Setter", selection: $hourSelection, displayedComponents: [.hourAndMinute])
    }
}

#Preview {
    @State var hourBinder = Date()
    return DateSelector(hourSelection: $hourBinder)
}
