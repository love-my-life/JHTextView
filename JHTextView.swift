//
//  JHTextView.swift
//  ElectricizePile
//
//  Created by hanchen on 16/8/23.
//  Copyright © 2016年 LiJianhui. All rights reserved.
//

import UIKit

@IBDesignable class JHTextView: UIView , UITextViewDelegate {

    @IBOutlet var contentView: UIView!
    @IBOutlet var textView: UITextView!
    /** 占位文字label */
    @IBOutlet private var placeholderLabel: UILabel!
    /** 占位文字 */
    @IBInspectable var placeholder : String? {
        get {
            return placeholderLabel.text
        }
        set {
            self.placeholderLabel.text = newValue
        }
    }
    /** 占位文字 颜色 */
    @IBInspectable var placeholderColor : UIColor = UIColor.lightGrayColor() {
        didSet {
            self.placeholderLabel.textColor = placeholderColor
        }
    }
    /** 占位文字 字体大小 */
    @IBInspectable var placeholderFont : CGFloat = 14 {
        didSet {
            self.placeholderLabel.font = UIFont.systemFontOfSize(placeholderFont)
        }
    }
    
    func loadViewFfromNib() -> UIView {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: String(self.dynamicType), bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        self.textView.delegate = self
        return view
    }
    
    func setupSubviews() {
        contentView = loadViewFfromNib()
        contentView.frame = bounds
        addSubview(contentView)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupSubviews()
    }
    /** UITextViewDelegate */
    func textViewDidBeginEditing(textView: UITextView) {
        self.placeholderLabel.hidden = true
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        self.placeholderLabel.hidden = textView.text != ""
    }
    
    
}









