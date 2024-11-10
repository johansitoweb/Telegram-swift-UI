//
//  CallRowView.swift
//  Telegram
//
//  Created by Arseniy Tkachenko on 09.07.2022.
//

import SwiftUI

enum CallType {
    case incoming
    case outgoing
    case missed
    
    var type: String {
        switch self {
        case .incoming: return "Incoming"
        case .outgoing: return "Outgoing"
        case .missed: return "Missed"
        }
    }
}

struct CallRowView: View {
    
    private var contact: String
    private var callTime: String
    private var callLength: String
    private var call: CallType
    
    init (contact: String, callTime: String, callLength: String, callType call: CallType) {
        self.contact = contact
        self.callTime = callTime
        self.callLength = callLength
        self.call = call
    }
    
    var body: some View {
        VStack{
            HStack{
                if (call == .outgoing) {
                    Image(systemName: "phone.arrow.up.right")
                } else {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 20, height: 20)
                }
                RoundedProfilePic("profilePic")
                    .frame(width: 56, height: 56)
                VStack (alignment: .leading) {
                    Text(contact)
                        .foregroundColor(call == .missed ? .red : .black)
                    let callDuration = call != .missed ? (" (" + callLength + ")") : ""
                    Text(call.type + callDuration)
                        .fontWeight(.light)
                        .foregroundColor(.gray)
                }
                HStack {
                    Spacer()
                    Text(callTime)
                        .fontWeight(.light)
                        .foregroundColor(.gray)
                        .padding(4)
                    Button {
                    } label: {
                        Image(systemName: "info.circle")
                            .foregroundColor(.blue)
                            
                    }
                    .padding(4)
                }
            }
            Divider()
        }
    }
}
struct CallRowView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CallRowView(contact: "Arsenii Tkachenko", callTime: "13.06", callLength: "5 min", callType: .outgoing)
            CallRowView(contact: "Arsenii Tkachenko", callTime: "13.06", callLength: "5 min", callType: .missed)
            CallRowView(contact: "Arsenii Tkachenko", callTime: "13.06", callLength: "5 min", callType: .incoming)
        }
    }
}
