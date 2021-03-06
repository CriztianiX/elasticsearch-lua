-------------------------------------------------------------------------------
-- Importing modules
-------------------------------------------------------------------------------
local Endpoint = require "elasticsearch.endpoints.Endpoint"

-------------------------------------------------------------------------------
-- Declaring module
-------------------------------------------------------------------------------
local Update = Endpoint:new()

-------------------------------------------------------------------------------
-- Declaring Instance variables
-------------------------------------------------------------------------------

-- The parameters that are allowed to be used in params
Update.allowedParams = {
  "consistency",
  "fields",
  "lang",
  "parent",
  "refresh",
  "replication",
  "retry_on_conflict",
  "routing",
  "script",
  "timeout",
  "timestamp",
  "ttl",
  "version",
  "version_type",
}

-------------------------------------------------------------------------------
-- Function to calculate the http request method
--
-- @return    string    The HTTP request method
-------------------------------------------------------------------------------
function Update:getMethod()
  return "POST"
end

-------------------------------------------------------------------------------
-- Function to calculate the URI
--
-- @return    string    The URI
-------------------------------------------------------------------------------
function Update:getUri()
  if self.id == nil then
    return nil, "id not specified for Update"
  end
  if self.index == nil then
    return nil, "index not specified for Update"
  end
  if self.type == nil then
    return nil, "type not specified for Update"
  end
  return "/" .. self.index .. "/" .. self.type .. "/" .. self.id .. "/_update"
end

-------------------------------------------------------------------------------
-- Returns an instance of Update class
-------------------------------------------------------------------------------
function Update:new(o)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  return o
end

return Update
