defmodule Cognac.Product do
  use Ecto.Schema
  import Ecto.Changeset
  alias Cognac.Product
  @type t :: %__MODULE__{}

  schema "products" do
    field :body, :string
    field :image_url, :string
    field :versions, {:array, :string}
    field :name, :string
    has_many :prices, Cognac.Product.Price
    belongs_to :page, Cognac.Page
    belongs_to :category, Cognac.Category

    timestamps()
  end

  @doc false
  def changeset(%Product{} = product, attrs) do
    product
    |> cast(attrs, [:name, :versions, :image_url, :body, :page_id])
    |> validate_required([:name])
  end
end
