import Config

if Mix.target() != :host do
  import_config "target.exs"
end

config :advantech_ark1124,
  target: Mix.target()
