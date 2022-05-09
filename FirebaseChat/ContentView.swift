//
//  ContentView.swift
//  FirebaseChat
//
//  Created by 中山龍 on 2022/05/07.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var user: User

    var body: some View {
        LoginView()
            .environmentObject(user)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(User())
    }
}
