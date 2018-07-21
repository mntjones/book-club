<%= form_tag '/books', method: 'post' do %>
	<%= label_tag('book[title]', "Title") %>
  <%= text_field_tag('book[title]') %><br>

  <%= label_tag('book[author]', "Author") %>
  <%= text_field_tag('book[author]') %><br>

  <%= label_tag('book[genre]', "Genre") %>
  <%= text_field_tag('book[genre]') %><br>

  <%= label_tag('book[pages]', "Number of Pages") %>
  <%= text_field_tag('book[pages]') %><br>

  <%= label_tag('book[month_assigned]', "Month Assigned for Book") %>
	<%= select_tag 'book[month_assigned]', options_for_select(@grouped_options) %> <br>

	<%= label_tag('book[year_assigned]', "Year assigned - YYYY format, please.") %>
  <%= text_field_tag('book[year_assigned]') %><br>

	<%= submit_tag("Create New Book") %>
<% end %>