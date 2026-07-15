import common
import product
import product.input

schema OutputPort(common.TagsDiscoverable):
    r"""
    An output port describing promises.

    Attributes
    ----------
    name : str, required
        Name of the output port.
    description : str, optional
        Human readable short description of the output port.
    $type : str, optional
        There can be different types of output ports, each automated and handled differently. Here you can indicate the type.
    version : str, required
        For each version, a different instance of the output port is listed. The combination of the name and version is the key.
    contractId : str, optional
        Contract ID for the output port.
    sbom : [Sbom], optional
        The SBOM can/should be at the version level.
    inputContracts : [InputContract], optional
        Dependencies or input contracts.
    tags : Tags, optional
        A list of tags that may be assigned to the elements (object or property); the tags keyword may appear at any level. Tags may be used to better categorize an element. For example, `finance`, `sensitive`, `employee_record`.
    customProperties : [CustomProperty], optional
        A list of key/value pairs for custom properties.
    authoritativeDefinitions : [AuthoritativeDefinition], optional
        List of links to sources that provide more details on the data contract.
    """
    name: str
    description?: str
    $type?: str
    version: str
    contractId?: str
    sbom?: [product.Sbom]
    inputContracts?: [input.InputContract]

