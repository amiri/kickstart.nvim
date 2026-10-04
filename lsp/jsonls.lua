local utils = require 'my_utils'

return {
  settings = {
    json = {
      -- Send custom json schemas to jsonls to provide its features when you open a json file
      schemas = utils.get_json_schemas(),
      validate = { enable = true },
    },
  },
}
