-- copied (and lightly modified) from
-- https://github.com/jasonrudolph/keyboard/blob/master/hammerspoon/status-message.lua

local drawing = require 'hs.drawing'
local geometry = require 'hs.geometry'
local screen = require 'hs.screen'
local styledtext = require 'hs.styledtext'

local statusmessage = {}
statusmessage.new = function(messageText)
  local buildParts = function(messageText)
    local frame = screen.primaryScreen():frame()

    local styledTextAttributes = {
      font = { name = 'Monaco', size = 16},
      color = { white = 1, alpha = 1 }
    }

    local styledText = styledtext.new('🔨 ' .. messageText, styledTextAttributes)

    local styledTextSize = drawing.getTextDrawingSize(styledText)
    local textRect = {
      x = 25,
      y = 45,
      w = styledTextSize.w + 20,
      h = styledTextSize.h + 20
    }
    local text = drawing.text(textRect, styledText):setAlpha(0.7)

    local background = drawing.rectangle(
      {
        x = textRect.x - 10,
        y = textRect.y - 10,
        w = textRect.w + 10,
        h = textRect.h + 10
      }
    )
    background:setRoundedRectRadii(10, 10)
    background:setFillColor({ red = 0, green = 0, blue = 0, alpha=0.9 })

    return background, text
  end

  return {
    _buildParts = buildParts,
    show = function(self)
      self:hide()

      self.background, self.text = self._buildParts(messageText)
      self.background:show()
      self.text:show()
    end,
    hide = function(self)
      if self.background then
        self.background:delete()
        self.background = nil
      end
      if self.text then
        self.text:delete()
        self.text = nil
      end
    end,
    notify = function(self, seconds)
      local seconds = seconds or 1
      self:show()
      hs.timer.delayed.new(seconds, function() self:hide() end):start()
    end
  }
end

return statusmessage
