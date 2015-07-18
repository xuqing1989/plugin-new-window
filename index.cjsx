{React, ReactBootstrap, FontAwesome} = window
remote = require 'remote'
windowManager = remote.require './lib/window'

module.exports =
  name: 'New-Window'
  priority: 100
  displayName: <span><FontAwesome name='sitemap' key={0} /> 一心二用</span>
  author: 'KochiyaOcean'
  link: 'https://github.com/kochiyaocean'
  version: '1.1.0'
  description: '打开新窗口以游玩其他游戏'
  handleClick: ->
    newWindow = windowManager.createWindow
        # Use config
        realClose: true
        x: config.get 'poi.window.x', 0
        y: config.get 'poi.window.y', 0
        width: 1100
        height: 700
      if process.env.DEBUG?
        newWindow.openDevTools
          detach: true
    newWindow.loadUrl "file://#{__dirname}/index.html"
    newWindow.show()
