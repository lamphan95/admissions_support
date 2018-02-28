module NotesHelper
  def show_note note
    case
    when note.is_start? && note.remarking?
      [nil, "pencil-square-o"]
    when note.is_start? && note.aspiration?
      [nil, "check-square-o"]
    when !note.is_start? && note.aspiration?
      ["themed-background-fire themed-border-fire", "check-square-o"]
    when !note.is_start? && note.remarking?
      ["themed-background-fire themed-border-fire", "pencil-square-o"]
    end
  end

  def check_time_note note
    case
    when note.time > DateTime.now
      t "next"
    else
      t "ago"
    end
  end

  def check_style name
    if name == Settings.aspiration
      Settings.primary
    else
      Settings.success
    end
  end

  def show_icon_note note
    content_tag :div, class: "timeline-icon #{show_note(note).first}" do
      content_tag :i, class: "fa fa-#{show_note(note).second}" do
      end
    end
  end

  def show_style_note name
    content_tag :span, class: "label label-#{check_style(name)}" do
      content_tag :b do
        t "note_style.#{name}"
      end
    end
  end
end