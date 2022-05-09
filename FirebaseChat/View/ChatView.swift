//
//  ChatView.swift
//  FirebaseChat
//
//  Created by 中山龍 on 2022/05/08.
//

import SwiftUI

struct ChatView: View {
    @ObservedObject var viewModel = ChatViewModel()
    @EnvironmentObject var user: User

    var body: some View {
        VStack {
            ScrollView {
                ForEach(viewModel.contentsArray) { content in
                    SpeechBubble(chatContent: content)
                }
            }
            HStack {
                TextField("チャットを入力", text: $viewModel.chatText)
                Button(action: {
                    viewModel.onTapSend()
                }, label: {
                    Text("送信")
                })
            }
        }.onAppear() {
            viewModel.getUser(user: self.user)
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
            .environmentObject(User())
    }
}
