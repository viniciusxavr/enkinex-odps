import regex
import common

schema ManagementPort(common.TagsDiscoverable):
    """
    Management port for managing the data product.

    Attributes
    ----------
    name : str, required
        Endpoint identifier or unique name.
    content : str, required
        Content type.
    $type : str, default is "rest", optional
        Type: can be `rest` or `topic`. Default is `rest`.
    url : str, optional
        URL to access the endpoint.
    channel : str, optional
        Channel to communicate with the data product.
    description : str, optional
        Purpose and usage.
    """
    name: str
    content: str
    $type?: str = "rest"
    url?: str
    channel?: str
    description?: str

    check:
        regex.match(url, common.urlPattern) if url

