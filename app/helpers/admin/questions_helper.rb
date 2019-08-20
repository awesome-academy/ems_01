module Admin::QuestionsHelper
  def link_to_add_field name, f, association
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |ff|
      render(association.to_s.singularize, f: ff)
    end
    link_to(name, "#", class: "add_fields",
      data: {id: id, fields: fields.delete("\n")})
  end

  def question_types
    @question_types = Question.question_types.map{|k, v| [t(k.to_s), v]}
  end
end
