Fabricator(:keyword) do
  name "Mobile"
  concrete true
end

Fabricator(:keyword2, class_name:"Keyword") do
  name "Project"
  concrete false
end
