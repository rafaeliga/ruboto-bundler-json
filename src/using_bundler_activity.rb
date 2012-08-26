require 'ruboto'
require 'json'

ruboto_import_widgets :Button, :EditText, :LinearLayout, :TextView

$activity.handle_create do |bundle|
  setTitle 'Ruboto Bundler Example'

  setup_content do
    linear_layout :orientation => :vertical do
      text_view :text => 'Ruby structure:'
      edit_text :text => '[{:a => 1}]', :id => 42
      button :text => 'Encode', :id => 43
      text_view :text => 'JSON string:'
      edit_text :id => 44
      button :text => 'Decode', :id => 45
      text_view :text => 'Decoded:'
      edit_text :id => 46
    end
  end

  handle_click do |view|
    case view.id
    when 43
      find_view_by_id(44).text = JSON.generate(eval(find_view_by_id(42).text.to_s)) rescue toast($!.message)
    when 45
      find_view_by_id(46).text = JSON.parse(find_view_by_id(44).text.to_s).inspect rescue toast($!.message)
    end
  end
end
