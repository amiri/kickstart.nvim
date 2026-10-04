local Exposed = {}

Exposed.rojo_project = function()
  return vim.fs.root(0, function(name)
    return name:match '.+%.project%.json$'
  end)
end

Exposed.get_json_schemas = function()
  local schemas = require('schemastore').json.schemas()

  -- Add the rojo json schema for rojo project files
  table.insert(schemas, {
    fileMatch = { '*.project.json' },
    url = 'https://raw.githubusercontent.com/rojo-rbx/vscode-rojo/master/schemas/project.template.schema.json',
  })

  return schemas
end

return Exposed
