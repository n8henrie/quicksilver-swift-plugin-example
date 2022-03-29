//
//  QSHomePlugin.swift
//  QSHomePlugin
//
//  Created by Nathan Henrie on 2022-03-03.
//  Copyright © 2022 Quicksilver. All rights reserved.
//

//import Foundation
//import Cocoa

class QSHomePluginSwiftAction : QSActionProvider {
    @objc func performSwiftActionOnObject(_ dObject: QSObject) -> QSObject {
        print("I'm here!")
        return QSObject(string: "here it comes!")
    }

    @objc func performActionDirectlyInSwift(_ dObject: QSObject) -> QSObject {
        print("I'm here 1!")
        return QSObject(string: "here it comes!")
    }

    @objc func performActionDirectlyInSwift(_ dObject: QSObject, using iObject: QSObject) -> QSObject {
        print("I'm here 2!")
        return QSObject(string: "there it went!")
    }

    @objc func performSwiftActionOnObject(_ dObject: QSObject, using iObject: QSObject) -> QSObject {
        print("I'm there!")
        return QSObject(string: "there it went!")
    }

    @objc func validActionsForDirectObject(_ dObject: QSObject, indirectObject iObject: QSObject) -> [String] {
        print("Just validating some actions")
        var newActions = [String]()
        newActions.append("DoSomethingInSwiftAction")
        return newActions
    }

    @objc func validIndirectObjectsForAction(_ action: String, directObject dObject: QSObject) -> [QSObject] {
        print("Just validating some indirecet objects here")
        if action == "DoSomethingInSwiftUsingAction" {
            print("Yup, that's the name!")

            var opts = [QSObject]()
            opts.append(QSObject(string: "First option!"))
            opts.append(QSObject(string: "Second option!"))
            return opts
        }
        return [QSObject(string: "You're outta options!")]
    }

    @objc func performSwiftActionFromObjC(_ dObject: QSObject) -> QSObject {
        print("I'm here 1!")
        return QSObject(string: "here it comes!")
    }
}

class QSHomePluginSwiftSource : QSObjectSource {
//    - (BOOL)indexIsValidFromDate:(NSDate *)indexDate forEntry:(NSDictionary *)theEntry
    @objc func indexIsValidFromDate(_ indexDate: NSDate, forEntry theEntry: NSDictionary) -> Bool {
        print("checking that index");
        return false;
    }

    // create and return an array of QSObjects to add to the catalog
//    - (NSArray *) objectsForEntry:(NSDictionary *)theEntry
    @objc func objectsForEntry(_ theEntry: NSDictionary) -> [QSObject] {
        print("here sourcing stuff");

//        var newObject = QSObject(type: "QSHomePluginTest", value: <#T##Any!#>, name: "Test HomePlugin Swifty Object")
        let newObject = QSObject(type: "QSHomePluginType", value: "this is my value!", name: "Test HomePlugin Swifty Object")!
        let anotherObject = QSHomePluginType        
//        newObject = [QSObject makeObjectWithIdentifier:@"QSHomePluginTest"];
//        [newObject setName:@"Test HomePlugin Object"];
//        [newObject setObject:@"data" forType:QSHomePluginType];
//        [newObject setPrimaryType:QSHomePluginType];
//        [objects addObject:newObject];

        return [newObject]
    }

    /*
     // an icon that is either already in memory or easy to load
     - (void)setQuickIconForObject:(QSObject *)object
     {
     [object setIcon:nil];
     }

     // a nicer or more "correct" icon that takes a while to create or obtain
     - (BOOL)loadIconForObject:(QSObject *)object
     {
     id data=[object objectForType:QSHomePluginType];
     [object setIcon:nil];
     return YES;
     }
     */
}
