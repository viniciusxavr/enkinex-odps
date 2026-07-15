import regex

schema AuthoritativeDefinition:
    """
    A type/link pair for authoritative definitions.

    Attributes
    ----------
    $type : str, required
        Type of definition for authority.
    url : str, required
        URL to the authority.
    description : str, optional
        Optional description.
    """
    $type: str
    url: str
    description?: str

    check:
        regex.match(url, urlPattern)

