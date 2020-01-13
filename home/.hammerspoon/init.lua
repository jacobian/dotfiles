local log = hs.logger.new('init.lua', 'debug')

require('windows')

hs.notify.new({
    title='Hammerspoon', 
    informativeText='🔨🥄'
}):send()

