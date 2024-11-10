//
//  CallsView.swift
//  Telegram
//
//  Created by Arseniy Tkachenko on 07.07.2022.
//

import SwiftUI

struct CallsView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Recent calls")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .textCase(.uppercase)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 4)
                    .foregroundColor(.gray)

                Spacer()
            }
            .background(Color(red: 247/255, green: 247/255, blue: 247/255))
            
            ScrollView {
                ForEach (0...5, id: \.self) { _ in
                    CallRowView(contact: "Arsenii Tkachenko", callTime: "13.06", callLength: "5 min", callType: .outgoing)
                    CallRowView(contact: "Arsenii Tkachenko", callTime: "13.06", callLength: "5 min", callType: .missed)
                    CallRowView(contact: "Arsenii Tkachenko", callTime: "13.06", callLength: "5 min", callType: .incoming)
                }
            }
            Spacer()
        }
    }
}

struct CallsView_Previews: PreviewProvider {
    static var previews: some View {
        CallsView()
    }
}
