//
//  TableSectionModel.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 06.09.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

class SectionModel: NSObject {

    private(set) var items: [AnyObject]
    private(set) var header: SectionHeader?
    private(set) var footer: SectionFooter?
    
    init(withItems items: [AnyObject],
         header: SectionHeader? = nil,
         footer: SectionFooter? = nil) {
        self.items = items
        self.header = header
        self.footer = footer
    }
    
    func removeItem(at index: Int) {
        items.remove(at: index)
    }
}

class SectionHeader: NSObject {
    
    var headerTitle: String?
    var headerViewModel: AnyObject?
    
    class func header(withTitle title: String?) -> SectionHeader {
        let header = SectionHeader()
        header.headerTitle = title
        return header
    }
    
    class func header(with viewModel: AnyObject?) -> SectionHeader {
        let header = SectionHeader()
        header.headerViewModel = viewModel
        return header
    }
    
}

class SectionFooter: NSObject {
    
    var footerTitle: String?
    var footerViewModel: AnyObject?
    
    class func footer(withTitle title: String?) -> SectionFooter {
        let footer = SectionFooter()
        footer.footerTitle = title
        return footer
    }
    
    class func footer(with viewModel: AnyObject?) -> SectionFooter {
        let footer = SectionFooter()
        footer.footerViewModel = viewModel
        return footer
    }

}
