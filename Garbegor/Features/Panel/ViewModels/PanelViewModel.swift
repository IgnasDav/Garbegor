//
//  PanelViewModel.swift
//  Garbegor
//
//  Created by Ignas Davulis on 2024-01-12.
//
import Foundation
import MapKit
import CoreLocation

extension PanelView {
    class ViewModel: ObservableObject {
        var hourSelection: Date = Date()
        private(set) var justAnExample: Date = Date()
    }
}
