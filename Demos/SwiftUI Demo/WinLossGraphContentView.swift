//
//  WinLossGraphContentView.swift
//  SwiftUI Demo
//
//  Created by Darren Ford on 26/1/21.
//

import SwiftUI
import DSFSparkline

struct WinLossGraphContentView: View {

	let leftDataSource: DSFSparklineDataSource
	let rightDataSource: DSFSparklineDataSource
	let upDataSource: DSFSparklineDataSource

	var body: some View {
		VStack {
			DSFSparklineWinLossGraphView.SwiftUI(
				dataSource: leftDataSource
			)
			DSFSparklineWinLossGraphView.SwiftUI(
				dataSource: rightDataSource,
				winColor: .systemIndigo,
				lossColor: .systemTeal,
				lineWidth: 3,
				barSpacing: 6,
				showZeroLine: true
			)
			DSFSparklineWinLossGraphView.SwiftUI(
				dataSource: upDataSource,
				winColor: .systemPink,
				lossColor: .systemYellow,
				barSpacing: 3,
				showZeroLine: true,
				zeroLineDefinition: DSFSparklineZeroLineDefinition(color: .textColor)
			)
			.frame(width: 300.0, height: 34.0)
		}
		.padding()
	}
}

var WinLossDataSource1: DSFSparklineDataSource = {
	let d = DSFSparklineDataSource(windowSize: 10, range: -1.0 ... 1)
	d.push(values: [1, 0, 1, 0, 1, 0, 1, 0, 1, 0])
	return d
}()

var WinLossDataSource2: DSFSparklineDataSource = {
	let d = DSFSparklineDataSource(windowSize: 10, range: -1.0 ... 1.0)
	d.push(values: [20, 10, 0, -10, -20, -30, 40, 50, 60, 70])
	return d
}()

var WinLossDataSource3: DSFSparklineDataSource = {
	let d = DSFSparklineDataSource(windowSize: 20, range: -1.0 ... 1)
	d.push(values: [1, 1, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1])
	return d
}()

struct WinLossGraphContentView_Previews: PreviewProvider {
	static var previews: some View {
		WinLossGraphContentView(leftDataSource: WinLossDataSource1,
										rightDataSource: WinLossDataSource2,
										upDataSource: WinLossDataSource3)
	}
}