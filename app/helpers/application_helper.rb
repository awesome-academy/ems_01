module ApplicationHelper
  def subjects
    @subjects = Subject.not_disable.sort_created_desc.map{|f| [f.name, f.id]}
  end
end
