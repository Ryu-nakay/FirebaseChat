//
//  SpeechBubble.swift
//  FirebaseChat
//
//  Created by 中山龍 on 2022/05/09.
//

import SwiftUI

struct SpeechBubble: View {
    @EnvironmentObject var user: User
    var chatContent: ChatContent
    var body: some View {
        if user.name == chatContent.sender {
            HStack {
                Spacer()
                Text(chatContent.content)
                Text(chatContent.sender)
            }
        } else {
            HStack {
                Text(chatContent.sender)
                Text(chatContent.content)
                Spacer()
            }
        }
    }
}

struct SpeechBubble_Previews: PreviewProvider {
    static var previews: some View {
        SpeechBubble(chatContent:  ChatContent(sender: "user", content: "hello world", date: "1652008734"))
            .environmentObject(User())
    }
}
