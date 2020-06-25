defmodule Smoke.Repo.Migrations.CreatePatients do
  use Ecto.Migration

  def change do
    create table(:patients) do
      add :identifier, :string
      add :active, :boolean, default: false, null: false
      add :firstName, :string
      add :middleName, :string
      add :lastName, :string
      add :prefix, :string
      add :suffix, :string
      add :gender, :string
      add :birthDate, :date
      add :deceased, :boolean, default: false, null: false
      add :deceasedDateTime, :time
      add :maritalStatus, :string
      add :multipleBirth, :boolean, default: false, null: false
      add :multipleBirthInteger, :integer
      add :photoURI, :string

      timestamps()
    end

  end
end
