import common

schema InputPort(common.TagsDiscoverable):
    """
    An input port describing expectations.

    Attributes
    ----------
    name : str, required
        Name of the input port.
    version : str, required
        Version of the input port.
    contractId : str, required
        Contract ID for the input port.
    """
    name: str
    version: str
    contractId: str

