//
//  ProspectsViewView.swift
//  HotProspects
//
//  Created by Rafael Calunga on 2021-01-09.
//

import SwiftUI

struct ProspectsView: View {
    enum FilterType {
        case none, contacted, uncontacted
    }
    
    @EnvironmentObject var prospects: Prospects
    
    let filter: FilterType
    
    var title: String {
        switch filter {
        case .none:
            return "Everyone"
        case .contacted:
            return "Contacted people"
        case .uncontacted:
            return "Uncontacted people"
        }
    }
    
    var body: some View {
        NavigationView {
            Text("People: \(prospects.people.count)")
                .navigationBarTitle(title)
                .navigationBarItems(
                    trailing: Button(action: {
                        let prospect = Prospect()
                        prospect.name = "Rafael"
                        prospect.emailAddress = "rafael@apple.com"
                        self.prospects.people.append(prospect)
                    }) {
                        Label("Scan", systemImage: "qrcode.viewfinder")
                    }
                )
        }
    }
}

struct ProspectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProspectsView(filter: .none)
    }
}
