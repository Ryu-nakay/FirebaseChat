//
//  LoginView.swift
//  FirebaseChat
//
//  Created by 中山龍 on 2022/05/07.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var user: User
    var body: some View {
        NavigationView {
            VStack {
                Text("LoginView")
                TextField("ユーザーネームを入力", text: $user.name)
                NavigationLink("チャット", destination: ChatView().environmentObject(user))
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(User())
    }
}
