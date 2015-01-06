helpers do


  def parse_XML_to_JSON(xml_file)
    hash_from_xml = Hash.from_xml(xml_file)
    filtered_messages = hash_from_xml["messages"].map do |message|
      {
        from: message["from"],
        subject: message["subject"],
        created_at: message["created_at"],
        body: message["body"]
      }
    end
    filtered_messages.to_json
  end

end

# http://dbc-mail.herokuapp.com/api/
# philipp@stalemail.com/
# messages?api_token=06ac86a96e3d4cbb9eb74343f03fdc67


# parse the URL of the mailbox
# parse the data in the URL into separate emails (XML format)
# convert the XML to JSON via Hash
