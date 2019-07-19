//
//  ReminderTableViewCell.swift
//  TODO-MVC
//
//  Created by Mohamed El-Taweel on 7/19/19.
//  Copyright © 2019 Demo. All rights reserved.
//

import UIKit

class ReminderTableViewCell: UITableViewCell {
    
    @IBOutlet weak var gridStack: UIStackView!
    @IBOutlet weak var titleValueLabel: UILabel!
    @IBOutlet weak var descriptionValueLabel: UILabel!
    @IBOutlet weak var priorityValueLabel: UILabel!
    @IBOutlet weak var dateValueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(with model: Reminder){
        titleValueLabel.text = model.title
        descriptionValueLabel.text = model.description
        let reminderPriorityInStringFormat = transformReminderPriorityToString(reminderPriority: model.priority)
        priorityValueLabel.text = reminderPriorityInStringFormat
        dateValueLabel.text = model.date.toString()
        let reminderNotesStackView = buildReminderNotesStackView(reminderNotes: model.notes)
        gridStack.addArrangedSubview(reminderNotesStackView)
    }
    
    private func transformReminderPriorityToString(reminderPriority: ReminderPriority)->String{
        switch reminderPriority {
        case .High:
            return "High"
        case .Normal:
            return "Normal"
        case .Low:
            return "Low"
        }
    }
    
    private func buildReminderNotesStackView(reminderNotes: [String:String])->UIStackView{
        let reminderNotesStackView = UIStackView()
        reminderNotesStackView.axis = .vertical
        reminderNotesStackView.alignment = .fill
        reminderNotesStackView.distribution = .fill
        for note in reminderNotes{
            let reminderNoteStackView = buildReminderNoteStackView(key: note.key, value: note.value)
            reminderNotesStackView.addArrangedSubview(reminderNoteStackView)
        }
        return reminderNotesStackView
    }
    
    private func buildReminderNoteStackView(key: String,value: String)->UIStackView{
        let reminderNoteStackView = UIStackView()
        reminderNoteStackView.axis = .horizontal
        reminderNoteStackView.alignment = .fill
        reminderNoteStackView.distribution = .fill
        let noteKeyLabel = UILabel()
        noteKeyLabel.text = key + " : "
        noteKeyLabel.setContentHuggingPriority(.defaultHigh, for: NSLayoutConstraint.Axis.horizontal)
        reminderNoteStackView.addArrangedSubview(noteKeyLabel)
        let noteValueLabel = UILabel()
        noteValueLabel.text = value
        reminderNoteStackView.addArrangedSubview(noteValueLabel)
        return reminderNoteStackView
    }
    
}
