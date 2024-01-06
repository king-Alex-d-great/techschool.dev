defmodule Techschool.Channels.Channel do
  use Ecto.Schema
  import Ecto.Changeset

  schema "channels" do
    field :name, :string
    field :image_url, :string
    field :youtube_channel_id, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(channel, attrs) do
    channel
    |> cast(attrs, [:name, :image_url, :youtube_channel_id])
    |> validate_required([:name, :image_url, :youtube_channel_id])
    |> unique_constraint(:youtube_channel_id)
  end
end
