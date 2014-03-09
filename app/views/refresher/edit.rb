<html>
	<head>
		<title></title>
	</head>
	<body>

		<%= start_form_tag(:action => 'update', :id => @album.id) %>
		
			Title: <%= text_field(:album, :title)  %><br />
			Artist: <%= text_field(:album, :artist) %><br />
			Genre: <%= text_field(:album, :genre) %><br />
			Release Date: <%= datetime_select(:album, :release_date, :start_year => 1960) %><br />
			<br />
			<%= submit_tag("Edit") %><br />

		<%= end_form_tag %>
		
	</body>
</html>
