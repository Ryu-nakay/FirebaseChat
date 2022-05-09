//
//  ChatViewModel.swift
//  FirebaseChat
//
//  Created by 中山龍 on 2022/05/08.
//

import Foundation
import FirebaseFirestore

class ChatViewModel: ObservableObject {
    var user: User?
    var listener: ListenerRegistration?
    let db = Firestore.firestore()

    init() {
        listener = db.collection("Chat").order(by: "date").addSnapshotListener { documentSnapshot, error in
            var tempRoom: [ChatContent] = []

                if let error = error {
                    print("ドキュメントの取得に失敗しました", error)
                } else {
                    if let documentSnapshots = documentSnapshot?.documents {
                        for document in documentSnapshots {
                            let data = document.data()
                            // アップデートされた際に行いたい処理を書く
                            print(data["sender"]!)
                            print(data["content"]!)
                            print(data["date"]!)
                            tempRoom.append(ChatContent(sender: "\(data["sender"]!)", content: "\(data["content"]!)", date: "\(data["date"]!)"))
                        }
                    }
                }
            self.contentsArray = tempRoom
            }
    }

    @Published var chatText = ""

    @Published var contentsArray: [ChatContent] = [ChatContent]()

    func getUser(user: User) {
        self.user = user
    }

    func onTapSend() {
        Firestore.firestore().collection("Chat").addDocument(data: [
            "sender": self.user?.name ?? "unknown",
            "content": chatText,
            "date": String(Date().timeIntervalSince1970)
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }

        self.chatText = ""
    }
}

class ChatContent: Identifiable {
    let id = UUID()
    let sender: String
    let content: String
    let date: String

    init(sender: String, content: String, date: String) {
        self.sender = sender
        self.content = content
        self.date = date
    }
}
