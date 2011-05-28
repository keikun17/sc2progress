module ApplicationHelper

  def bracket_identifier(bracket)
    identifier =  case bracket
    when "1"
      "1v1"
    when "2"
      "2v2"
    when "3"
      "3v3"
    when "4"
      "4v4"
    else
      "FFA"
    end
    return identifier
  end
  
  def strategy_lists(character)
    
    strategies
  end
  
end
