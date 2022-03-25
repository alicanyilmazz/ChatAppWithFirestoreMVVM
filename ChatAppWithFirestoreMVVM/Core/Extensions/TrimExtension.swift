//
//  TrimExtension.swift
//  ChatAppWithFirestoreMVVM
//
//  Created by alican on 25.03.2022.
//

import Foundation

extension String {
    enum TrimmingOptions {
        case all
        case leading
        case trailing
        case leadingAndTrailing
    }
    
    func trimming(spaces: TrimmingOptions, using characterSet: CharacterSet = .whitespacesAndNewlines) ->  String {
        switch spaces {
        case .all: return trimmingAllSpaces(using: characterSet)
        case .leading: return trimingLeadingSpaces(using: characterSet)
        case .trailing: return trimingTrailingSpaces(using: characterSet)
        case .leadingAndTrailing:  return trimmingLeadingAndTrailingSpaces(using: characterSet)
        }
    }
    
    private func trimingLeadingSpaces(using characterSet: CharacterSet) -> String {
        guard let index = firstIndex(where: { !CharacterSet(charactersIn: String($0)).isSubset(of: characterSet) }) else {
            return self
        }

        return String(self[index...])
    }
    
    private func trimingTrailingSpaces(using characterSet: CharacterSet) -> String {
        guard let index = lastIndex(where: { !CharacterSet(charactersIn: String($0)).isSubset(of: characterSet) }) else {
            return self
        }

        return String(self[...index])
    }
    
    private func trimmingLeadingAndTrailingSpaces(using characterSet: CharacterSet) -> String {
        return trimmingCharacters(in: characterSet)
    }
    
    private func trimmingAllSpaces(using characterSet: CharacterSet) -> String {
        return components(separatedBy: characterSet).joined()
    }
}

/*
 
 USING SAMPLE :
 
 let string = "  Hello World "

 let withoutLeadingSpaces = string.trimming(spaces: .leading) // "Hello World "
 let withoutTrailingSpaces = string.trimming(spaces: .trailing) // "   Hello World"
 let withoutLeadingAndTrailingSpaces = string.trimming(spaces: .leadingAndTrailing) // "Hello World"
 let withoutAllSpaces = string.trimming(spaces: .all) // "HelloWorld"
 
 */
