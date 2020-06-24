# Patient FHIR Resource Module
# Author: Ryan Boone
#
# Description
#
#   This represents the R4 version of the Patient resource
#

defmodule Patient do
    @enforce_keys [:identifier, :name, :gender, :birthDate]
    defstruct [
        :identifier, :active, :name, :telecom, :gender, :birthDate,
        :deceasedBoolean, :deceasedDateTime, :address, :maritalStatus,
        :multipleBirthBoolean, :multipleBirthInteger, :photo,
        :contact, :generalPractitioner, :managingOrganization, :link
    ]

    def patientToJSON(patient) do
        Jason.encode!(patient)
    end
end

defimpl FhirResource, for: Patient do
    def toJSON(_patient), do: patientToJSON(_patient)
end