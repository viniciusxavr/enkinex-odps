import regex
import common

schema ManagementPort(common.TagsDiscoverable):
    r"""
    Management port for managing the data product.

    Attributes
    ----------
    name : str, required
        Endpoint identifier or unique name.
    content : str, required
        Content type.
    $type : str, optional, default is "rest"
        Type: can be `rest` or `topic`. Default is `rest`.
    url : str, optional
        URL to access the endpoint.
    channel : str, optional
        Channel to communicate with the data product.
    description : str, optional
        Purpose and usage.
    tags : Tags, optional
        A list of tags that may be assigned to the elements (object or property); the tags keyword may appear at any level. Tags may be used to better categorize an element. For example, `finance`, `sensitive`, `employee_record`.
    customProperties : [CustomProperty], optional
        Custom properties block.
    authoritativeDefinitions : [AuthoritativeDefinition], optional
        Authoritative definitions block.
    """
    name: str
    content: str
    $type?: str = "rest"
    url?: str
    channel?: str
    description?: str

    check:
        regex.match(url, common.urlPattern) if url

