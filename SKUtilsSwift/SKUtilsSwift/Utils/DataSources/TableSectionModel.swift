//
//  TableSectionModel.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 06.09.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

class TableSectionModel: NSObject {

    var items: Array<AnyObject>?
    var header: TableSectionHeader?
    var footer: TableSectionFooter?
}

class TableSectionHeader: NSObject {
    var headerTitle: String?
    var headerView: UIView?
}

class TableSectionFooter: NSObject {
    var footerTitle: String?
    var footerView: UIView?
}