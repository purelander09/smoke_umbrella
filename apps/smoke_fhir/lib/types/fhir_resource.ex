defprotocol FhirResource do
    @doc "Converts the resource into JSON"
    def toJSON(data)
end