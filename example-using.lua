function initEffect (c, options, name)
	if not name then name = 'fx' end
	
	
	if not awful.client.property.get(c, name) then
	
		require("effect");
		
		if not options then
			options = {
				duration = 1, 
				transition = Effect.Transitions.easeIn.Bounce
			}
		end
		
		awful.client.property.set(c, name, Effect.create(
			function (props) 
				return c:geometry(props)
			end, 
			options
		))
	end
	return awful.client.property.get(c, name)
end

-- Vogel functionality
vogel = nil

function vogelEffect ()
	if not vogel then
		return awful.util.spawn(terminal .. " -title vogel")
	end
	vogel.screen = mouse.screen
	client.focus = vogel
	vogel:raise()
	vogel:tags({awful.tag.selected(mouse.screen)})
	initEffect(vogel):start({
		x = mouse.coords().x - vogel:geometry().width/2, 
		y = mouse.coords().y - vogel:geometry().height/2
	})
end

globalkeys = awful.util.table.join(globalkeys,
	awful.key({ "Shift" }, "F1", vogelEffect)
)

client.add_signal("manage", function (c, startup)
	if c.name == 'vogel' then
		vogel = c
		vogelEffect()
	end
end)

client.add_signal("unmanage", function (c, startup)
	if c.name == 'vogel' then
		vogel = nil
	end
end)


-- Move windows
clientkeys = awful.util.table.join(clientkeys,
	-- move client to right screen edge
	awful.key({ modkey, "Control"  }, "Right",		function (c)
		initEffect(c):start({x = screen[c.screen].workarea.width - c:geometry().width});
	end),
	-- move client to left screen edge
	awful.key({ modkey, "Control"  }, "Left",		function (c)
		initEffect(c):start({x = 0});
	end),
	-- move client to top screen edge
	awful.key({ modkey, "Control"  }, "Up",		function (c)
		initEffect(c):start({y = 0});
	end),
	-- move client to bottom screen edge
	awful.key({ modkey, "Control"  }, "Down",		function (c)
		initEffect(c):start({y = screen[c.screen].workarea.height - c:geometry().height});
	end),
	
	-- make client height smaller
	awful.key({ modkey, "Control", "Shift"  }, "Up",		function (c)
		initEffect(c, {
			duration = 0.2, 
			transition = Effect.Transitions.linear
		}, 'fx-size'):start({height = c:geometry().height - 50});
	end),
	-- make client height bigger
	awful.key({ modkey, "Control", "Shift"  }, "Down",		function (c)
		initEffect(c, {
			duration = 0.2, 
			transition = Effect.Transitions.linear
		}, 'fx-size'):start({height = c:geometry().height + 50});
	end),
	-- make client width smaller
	awful.key({ modkey, "Control", "Shift"  }, "Left",		function (c)
		initEffect(c, {
			duration = 0.2, 
			transition = Effect.Transitions.linear
		}, 'fx-size'):start({width = c:geometry().width - 50});
	end),
	-- make client width bigger
	awful.key({ modkey, "Control", "Shift"  }, "Right",		function (c)
		initEffect(c, {
			duration = 0.2, 
			transition = Effect.Transitions.linear
		}, 'fx-size'):start({width = c:geometry().width + 50});
	end)
)
