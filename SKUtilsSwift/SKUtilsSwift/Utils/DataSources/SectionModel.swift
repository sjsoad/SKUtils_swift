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
}

class SectionHeader: NSObject {
    var headerTitle: String?
}

class SectionFooter: NSObject {
    var footerTitle: String?
}