/*
* Copyright (c) 2015 Razeware LLC
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
*/

import UIKit

class ViewController: UIViewController {
  // MARK: - Variables
  @IBOutlet fileprivate weak var iconImageView: UIImageView!
  @IBOutlet fileprivate weak var appNameLabel: UILabel!
  @IBOutlet fileprivate weak var skipButton: UIButton!
  @IBOutlet fileprivate weak var appImageView: UIImageView!
  @IBOutlet fileprivate weak var welcomeLabel: UILabel!
  @IBOutlet fileprivate weak var summaryLabel: UILabel!
  @IBOutlet fileprivate weak var pageControl: UIPageControl!

  fileprivate let horizontalPadding: CGFloat = 15.0
  
  // MARK: - View Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let metrics = ["hp":horizontalPadding,
    "iconImageViewWidth":30]
    // 1
    let views : [String : AnyObject] = ["iconImageView": iconImageView,
      "appNameLabel": appNameLabel,
      "skipButton": skipButton,
      "appImageView": appImageView,
      "welcomeLabel": welcomeLabel,
      "summaryLabel": summaryLabel,
      "pageControl": pageControl,
      "topLayoutGuide": topLayoutGuide,
      "bottomLayoutGuide": bottomLayoutGuide]
    
    // 2
    var allConstraints = [NSLayoutConstraint]()
    
    // 3
    let iconVerticalConstraints = NSLayoutConstraint.constraints(
      withVisualFormat: "V:[topLayoutGuide]-[iconImageView(30)]",
      options: [],
      metrics: nil,
      views: views)
    allConstraints += iconVerticalConstraints
  
    // 6
    let topRowHorizontalConstraints = NSLayoutConstraint.constraints(
      withVisualFormat: "H:|-hp-[iconImageView(iconImageViewWidth)]-[appNameLabel]-[skipButton]-hp-|",
      options: [.alignAllCenterY],
      metrics: metrics,
      views: views)
    allConstraints += topRowHorizontalConstraints
    
    // 1
    let summaryHorizontalConstraints = NSLayoutConstraint.constraints(
      withVisualFormat: "H:|-hp-[summaryLabel]-hp-|",
      options: [],
      metrics: metrics,
      views: views)
    allConstraints += summaryHorizontalConstraints
    
    // 2
    let iconToImageVerticalConstraints = NSLayoutConstraint.constraints(
      withVisualFormat: "V:[iconImageView]-10-[appImageView]",
      options: [],
      metrics: nil,
      views: views)
    allConstraints += iconToImageVerticalConstraints
    
    // 3
    let imageToWelcomeVerticalConstraints = NSLayoutConstraint.constraints(
      withVisualFormat: "V:[appImageView]-10-[welcomeLabel]",
      options: [.alignAllCenterX],
      metrics: nil,
      views: views)
    allConstraints += imageToWelcomeVerticalConstraints

    // 4
    let summaryLabelVerticalConstraints = NSLayoutConstraint.constraints(
      withVisualFormat: "V:[welcomeLabel]-4-[summaryLabel]",
      options: [.alignAllLeading, .alignAllTrailing],
      metrics: nil,
      views: views)
    allConstraints += summaryLabelVerticalConstraints
    
    // 5
    let summaryToPageVerticalConstraints = NSLayoutConstraint.constraints(
      withVisualFormat: "V:[summaryLabel]-15-[pageControl(9)]-15-|",
      options: [.alignAllCenterX],
      metrics: nil,
      views: views)
    allConstraints += summaryToPageVerticalConstraints
    
    // 7
    NSLayoutConstraint.activate(allConstraints)
    
  }
}
