//
//  NFXPathNodeManager.swift
//  netfox_ios
//
//  Created by Ștefan Suciu on 2/5/18.
//  Copyright © 2018 kasketis. All rights reserved.
//

import Foundation

final class NFXPathNodeManager {
    
    static let sharedInstance = NFXPathNodeManager()
    fileprivate var rootNode = NFXPathNode(name: "root")
    
    func add(_ arr: [NFXHTTPModel]) {
        arr.forEach{ add($0) }
    }
    
    func add(_ obj: NFXHTTPModel) {
        guard let nodes = obj.requestURL?.split(separator: "/").dropFirst().map({ NFXPathNode(name: String($0)) }) else {
            return
        }
        
        let nodesWithoutLast = nodes.dropLast()
        var previousNode = rootNode
        for node in nodesWithoutLast {
            if let foundNode = previousNode.find(node) {
                previousNode = foundNode
            } else {
                previousNode.insert(node)
                previousNode = node
            }
        }
        let resourceNode = NFXPathNode(name: nodes.map{ $0.name }.joined(separator: "/"))
        resourceNode.httpModel = obj
        previousNode.insert(resourceNode)
    }
    
    func clear() {
        rootNode.children = []
    }
    
    func getModels() -> [NFXPathNode] {
        rootNode.printTree()
        return rootNode.children
    }
    
    func getTableModels() -> [NFXPathNode] {
        return rootNode.toArray()
    }
}
