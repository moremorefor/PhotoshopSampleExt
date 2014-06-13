# /*jslint vars: true, plusplus: true, devel: true
# nomen: true, regexp: true, indent: 4, maxerr: 50 */
# /*global $, window, location, CSInterface, SystemPath, themeManager*/

do ->
  'use strict'

  csInterface = new CSInterface()
    
  reloadPanel = ->
    location.reload()
    
  init = ->
    themeManager.init
                
    $("#btn_test").click ->
      csInterface.evalScript('sayHello()')
        
    $("#btn_reload").click reloadPanel
        
  init()
