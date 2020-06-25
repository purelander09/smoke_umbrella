defmodule Smoke.R4.Patient do
  use Ecto.Schema
  import Ecto.Changeset

  schema "patients" do
    field :active, :boolean, default: false
    field :birthDate, :date
    field :deceased, :boolean, default: false
    field :deceasedDateTime, :time
    field :firstName, :string
    field :gender, :string
    field :identifier, :string
    field :lastName, :string
    field :maritalStatus, :string
    field :middleName, :string
    field :multipleBirth, :boolean, default: false
    field :multipleBirthInteger, :integer
    field :photoURI, :string
    field :prefix, :string
    field :suffix, :string

    timestamps()
  end

  @doc false
  def changeset(patient, attrs) do
    patient
    |> cast(attrs, [:identifier, :active, :firstName, :middleName, :lastName, :prefix, :suffix, :gender, :birthDate, :deceased, :deceasedDateTime, :maritalStatus, :multipleBirth, :multipleBirthInteger, :photoURI])
    |> validate_required([:identifier, :active, :firstName, :middleName, :lastName, :prefix, :suffix, :gender, :birthDate, :deceased, :deceasedDateTime, :maritalStatus, :multipleBirth, :multipleBirthInteger, :photoURI])
  end
end
