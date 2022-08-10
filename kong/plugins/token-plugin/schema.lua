local typedefs = require "kong.db.schema.typedefs"


local PLUGIN_NAME = "token-plugin"


local schema = {
  name = PLUGIN_NAME,
  fields = {
    -- the 'fields' array is the top-level entry with fields defined by Kong
    { consumer = typedefs.no_consumer }, -- this plugin cannot be configured on a consumer (typical for auth plugins)
    { protocols = typedefs.protocols_http },
    { config = {
      -- The 'config' record is the custom part of the plugin schema
      type = "record",
      fields = {
        -- a standard defined field (typedef), with some customizations

        {url_verify_token = { type = "string", required = true }},
        {method = { default = "GET", type = "string" }},
        {connect_timeout = { default = 10000, type = "number" }},
        {send_timeout = { default = 60000, type = "number" }},
        {read_timeout = { default = 60000, type = "number" }}
      },
    },
    },
  },
}

return schema
