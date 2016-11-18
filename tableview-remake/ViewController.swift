//
//  ViewController.swift
//  tableview-remake
//
//  Created by Izaak Prats on 11/18/16.
//  Copyright © 2016 IJVP. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    // MARK: UI
    @IBOutlet weak var tableView: NSTableView!
    @IBOutlet weak var textField: NSTextField!
    @IBAction func addClicked(_ sender: Any) {
        if let item = textField?.stringValue {
            items.append(item)
            textField?.stringValue = ""
        }
    }
    
    // MARK: Properties
    var items = [String]() {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        items = ["Item 1", "Item 2"]
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
}

extension ViewController: NSTableViewDelegate, NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        if let cell = tableView.make(withIdentifier: "ItemCell", owner: nil) as? NSTableCellView {
            cell.textField?.stringValue = items[row]
            return cell
        }
        
        return nil
    }
}
