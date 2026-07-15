schema Description(AuthoritativeCustomizable):
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
    customProperties : [CustomProperty], optional
        A list of key/value pairs for custom properties.
    authoritativeDefinitions : [AuthoritativeDefinition], optional
        List of links to sources that provide more details on the data contract.
    """
    purpose?: str
    limitations?: str
    usage?: str

