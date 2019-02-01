import UIKit
import PinLayout

class View: UIView {
    fileprivate let containerView = UIView()

    fileprivate let weekDayLabel = UILabel()
    fileprivate let dayLabel = UILabel()
    fileprivate let monthLabel = UILabel()
    fileprivate let timeLabel = UILabel()
    
    init() {
        super.init(frame: CGRect.zero)

        backgroundColor = UIColor(red: 255.0 / 255.0, green: 56.0 / 255.0, blue: 41.0 / 255.0, alpha: 1.0)
        addSubview(containerView)

        weekDayLabel.font = UIFont.systemFont(ofSize: 36, weight: .ultraLight)
        weekDayLabel.textColor = UIColor.white
        containerView.addSubview(weekDayLabel)
        
        dayLabel.font = UIFont.systemFont(ofSize: 80, weight: .light)
        dayLabel.textColor = UIColor.white
        containerView.addSubview(dayLabel)
        
        monthLabel.font = UIFont.systemFont(ofSize: 36, weight: .medium)
        monthLabel.textColor = UIColor.white
        containerView.addSubview(monthLabel)
        
        timeLabel.font = UIFont.systemFont(ofSize: 30, weight: .light)
        timeLabel.textColor = UIColor.white
        containerView.addSubview(timeLabel)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        weekDayLabel.pin.topCenter().sizeToFit()
        dayLabel.pin.below(of: weekDayLabel).hCenter().marginTop(20).sizeToFit()
        monthLabel.pin.below(of: dayLabel).hCenter().marginTop(10).sizeToFit()
        timeLabel.pin.below(of: monthLabel).hCenter().marginTop(30).sizeToFit()

        containerView.pin.wrapContent().center()
    }
}

extension View {
    func refreshDate(weekDay: String, day: String, month: String, time: String) {
        weekDayLabel.text = weekDay
        dayLabel.text = day
        monthLabel.text = month
        timeLabel.text = time

        setNeedsLayout()
    }
}
