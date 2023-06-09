//
//  BackgroundImageView.swift
//  Devote
//
//  Created by Ashish Yadav on 01/04/23.
//

import SwiftUI

struct BackgroundImageView: View {
    // MARK: - Properties
    
    // MARK: - Body
    var body: some View {
        Image("rocket")
            .antialiased(true)
            .resizable()
            .scaledToFill()
            .ignoresSafeArea(.all)
    }
}

// MARK: - Preview
struct BackgroundImageView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundImageView()
    }
}
