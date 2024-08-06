//
//  ContentView.swift
//  OnlineShop
//
//  Created by Khusrav Safiev on 8/6/24.
//

import SwiftUI
import FirebaseFirestore

struct MainView: View {
    @FirestoreQuery(collectionPath: "Shop") var items: [Product]
    var body: some View {
        List {
            ForEach(items) { item in
                Text(item.name)
            }
        }
    }
}

#Preview {
    MainView()
}
