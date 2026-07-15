import common

schema InputPort(common.TagsDiscoverable):
    r"""
    An input port describing expectations.

    Attributes
    ----------
    name : str, required
        Name of the input port.
    version : str, required
        Version of the input port.
    contractId : str, required
        Contract ID for the input port.
    tags : Tags, optional
        A list of tags that may be assigned to the elements (object or property); the tags keyword may appear at any level. Tags may be used to better categorize an element. For example, `finance`, `sensitive`, `employee_record`.
    customProperties : [CustomProperty], optional
        A list of key/value pairs for custom properties.
    authoritativeDefinitions : [AuthoritativeDefinition], optional
        List of links to sources that provide more details on the data contract.
    """
    name: str
    version: str
    contractId: str

