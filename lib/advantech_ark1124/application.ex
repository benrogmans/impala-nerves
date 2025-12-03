defmodule AdvantechArk1124.Application do
  @moduledoc """
  Nerves application for Advantech ARK1124H mini PC
  """
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {RingLogger, max_size: 100},
      AdvantechArk1124.Supervisor
    ]

    opts = [strategy: :one_for_one, name: AdvantechArk1124.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
