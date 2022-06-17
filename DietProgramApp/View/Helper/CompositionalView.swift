//
//  CompositionalView.swift
//  DietProgramApp
//
//  Created by İbrahim Güler on 7.06.2022.
//

import SwiftUI

struct CompositionalView< Content, Item, ID>: View where Content: View, ID: Hashable, Item: RandomAccessCollection, Item.Element: Hashable {
    var content : (Item.Element) -> Content
    var items : Item
    var id : KeyPath<Item.Element, ID>
    var spacing : CGFloat
    
    init(items : Item, id : KeyPath<Item.Element, ID>, spacing : CGFloat = 5, content: @escaping (Item.Element) -> Content) {
        self.items = items
        self.id = id
        self.spacing = spacing
        self.content = content
    }
    
    var body: some View {
        LazyVStack(spacing: spacing) {
            ForEach(generateColumns(), id: \.self) { row in
                RowView(row: row)
            }
        }
    }
    
    @ViewBuilder
    func RowView(row: [Item.Element]) -> some View {
        GeometryReader { proxy in
            let width = proxy.size.width
            let columnWidth = (width > 0 ? ((width - (spacing)) / 2) : 0)
            HStack(spacing: spacing) {
                HStack(spacing : spacing) {
                    SafeView(row: row, index: 0)
                        .frame(width: columnWidth)
                    SafeView(row: row, index: 1)
                        .frame(width: columnWidth)
                }
            }
        }.frame(height: 170)
    }
    
    @ViewBuilder
    func SafeView(row: [Item.Element], index: Int) -> some View {
        if (row.count - 1) >= index {
            content(row[index])
        }
    }
    
    func generateColumns() -> [[Item.Element]] {
        var columns : [[Item.Element]] = []
        var row : [Item.Element] = []
        
        for item in items {
            if row.count == 2 {
                columns.append(row)
                row.removeAll()
                row.append(item)
            } else {
                row.append(item)
            }
        }
        
        columns.append(row)
        row.removeAll()
        
        return columns
    }
}
