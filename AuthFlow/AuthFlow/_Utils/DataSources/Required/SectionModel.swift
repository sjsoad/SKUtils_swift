//
//  TableSectionModel.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 06.09.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

class SectionModel: NSObject {

    var items: Array<AnyObject> = []
    var header: SectionHeader?
    var footer: SectionFooter?
    
    init(withItems items: Array<AnyObject>,
                   header: SectionHeader?,
                   footer: SectionFooter?) {
        self.items = items
        self.header = header
        self.footer = footer
    }
}

class SectionHeader: NSObject {
    
    var headerTitle: String?
    
    class func header(withTitle title:String?) -> SectionHeader {
        let header = SectionHeader()
        header.headerTitle = title
        return header
    }
    
}

class SectionFooter: NSObject {
    
    var footerTitle: String?
    
    class func footer(withTitle title:String?) -> SectionFooter {
        let footer = SectionFooter()
        footer.footerTitle = title
        return footer
    }

}
