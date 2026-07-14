import common

schema InputPort:
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
    tags : [str], optional
        A list of tags that may be assigned to the elements (object or property); the tags keyword may appear at any level. Tags may be used to better categorize an element. For example, `finance`, `sensitive`, `employee_record`.
    customProperties : [CustomProperty], optional
        Custom properties block.
    authoritativeDefinitions : [AuthoritativeDefinition], optional
        Authoritative definitions block.
    """

    name: str
    version: str
    contractId: str
    tags?: [str]
    customProperties?: [common.CustomProperty]
    authoritativeDefinitions?: [common.AuthoritativeDefinition]