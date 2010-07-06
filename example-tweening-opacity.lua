fx = Effect.create(client_instance, {
  duration = 0.8, -- seconds
  fps = 60, -- frames per second (defaults to 40)
  transition = Effect.Transitions.easeOut.Quint -- defaults to Effect.Transitions.linear
})

fx:start({
  opacity = 1
})
