defmodule SmokeWeb.PatientView do
  use SmokeWeb, :view
  alias SmokeWeb.PatientView

  def render("index.json", %{patients: patients}) do
    %{data: render_many(patients, PatientView, "patient.json")}
  end

  def render("show.json", %{patient: patient}) do
    %{data: render_one(patient, PatientView, "patient.json")}
  end

  def render("patient.json", %{patient: patient}) do
    %{id: patient.id,
      identifier: patient.identifier,
      active: patient.active,
      firstName: patient.firstName,
      middleName: patient.middleName,
      lastName: patient.lastName,
      prefix: patient.prefix,
      suffix: patient.suffix,
      gender: patient.gender,
      birthDate: patient.birthDate,
      deceased: patient.deceased,
      deceasedDateTime: patient.deceasedDateTime,
      maritalStatus: patient.maritalStatus,
      multipleBirth: patient.multipleBirth,
      multipleBirthInteger: patient.multipleBirthInteger,
      photoURI: patient.photoURI}
  end
end
