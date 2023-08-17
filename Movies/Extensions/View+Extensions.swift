//
//  View+Extensions.swift
//  MoviesApp
//
//  Created by Subhajit Paul on 24/4/2023.
//

import Foundation
import SwiftUI

extension View {
    
    func embedInNavigationView() -> some View {
        NavigationView { self }
    }
    
}
