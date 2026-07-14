schema Description:
    r"""
    Object containing the descriptions.

    Attributes
    ----------
    purpose : str, optional
        Intended purpose for the provided data.
    limitations : str, optional
        Technical, compliance, and legal limitations for data use.
    usage : str, optional
        Recommended usage of the data.
    authoritativeDefinitions : [AuthoritativeDefinition], optional
        List of links to sources that provide more details on the data contract.
    customProperties : [CustomProperty], optional
        A list of key/value pairs for custom properties.
    """

    purpose?: str
    limitations?: str
    usage?: str
    authoritativeDefinitions?: [AuthoritativeDefinition]
    customProperties?: [CustomProperty]