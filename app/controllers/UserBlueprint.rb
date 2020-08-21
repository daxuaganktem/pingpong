class UserBlueprint < Blueprinter::Base
    identifier :id
  
    fields :name, :win, :loss, :diff
  end