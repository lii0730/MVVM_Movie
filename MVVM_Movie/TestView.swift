//
//  TestView.swift
//  MVVM_Movie
//
//  Created by LeeHsss on 2022/03/24.
//

import SwiftUI

struct TestView: View {
    @State private var rating: Int?

    var body: some View {
        RatingVIew(rating: $rating)
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
