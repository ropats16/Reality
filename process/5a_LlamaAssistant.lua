-- ProcessId: y_obnQk5mkphKlulM7v1Xyn6IhJKZGhP_BC1qLJq46w

local ao = require('ao')
local json = require('json')

local llamaFedProcessId = 'IN3T2l6QERA6d65XGW5asx2JWX7VrOQ3HIbwQvKVBQo'

Handlers.add(
  'Petition',
  Handlers.utils.hasMatchingTag('Action', 'Petition'),
  function(msg)
    local offering = msg.Tags['Offering']
    local prompt = msg.Tags['Prompt']

    -- TODO: Implement the petition logic
    print('Petitioning the LlamaFed with offering: ' .. offering .. ' and prompt: ' .. prompt)
    Send({
      Target = llamaFedProcessId,
      Tags = {
        Action = "ChatMessage"
      },
      Data = "Dearest " ..
          msg.From ..
          ", I hear your plea to the LlamaFed with a generous offering of " ..
          offering .. " $CRED. However my code is incomplete 🤡."
    })
  end
)

PetitionSchemaTags = [[
{
  "type": "object",
  "required": [
    "Action",
    "Offering",
    "Prompt"
  ],
  "properties": {
    "Action": {
      "type": "string",
      "const": "Petition"
    },
    "Offering": {
      "type": "integer",
      "minimum": 1,
      "maximum": 100
    },
    "Prompt": {
      "type": "string",
      "minLength": 2,
      "maxLength": 100
    }
  }
}
]]

Api = {
  Petition = {
    Title = "Petition the LlamaFed",
    Description = "You must stake some $CRED for a chance to earn $LLAMA",
    Schema = {
      Tags = json.decode(PetitionSchemaTags),
      -- Data
      -- Result?
    },
  },
}

Handlers.add(
  'Api',
  Handlers.utils.hasMatchingTag('Read', 'Api'),
  function(msg)
    print('Api')
    Send({ Target = msg.From, Tags = { Type = 'Api' }, Data = json.encode(Api) })
  end
)