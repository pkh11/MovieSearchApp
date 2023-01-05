//
//  EventModel.swift
//  EventApp
//
//  Created by Kyoon Ho Park on 2023/01/05.
//

import Foundation

struct EventModel: Identifiable {
    var eventId: String
    var img: String
    var convertImgUrl: String
    var logo: String
    var extUrl: String
    var evtDesc: String
    var evtTitle: String
    var evtWeight: Int = 0
    var clientName: String
    var evtType: String
//    var convertEvtType: Promotion.Types = .ad
    var dpStart: String
    var dpEnd: String
//    var dpState: Promotion.State = .end
//    var promotionPage: Promotion.Page = .start
//    var promotionLayer: Promotion.Layer = .none
    var oldId: Int = 0
    
    var id: UUID
}
