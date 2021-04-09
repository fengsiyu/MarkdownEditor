//
//  HTMLView.swift
//  MarkdownEditor
//
//  Created by Patrick Van den Bergh on 08/04/2021.
//

import SwiftUI

struct HTMLView: View {
    var text: String
    @State var htmlToggle = true
    var body: some View {
        VStack {
            VStack {
                if htmlToggle {
                    ScrollView {
                        Text(htmlText())
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(Font.custom("Courier", size: 14.0))
                    }
                } else {
                    WebView(html: htmlText())
                }
                Spacer()
            }
            .background(Color.white)
            Toggle("View source",isOn: $htmlToggle)
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
    }
    func htmlText() -> String {
        let scanner = Scanner(source: text)
        return scanner.getHtml()
    }

}

struct HTMLView_Previews: PreviewProvider {
    static var previews: some View {
        HTMLView(text: "Test")
    }
}