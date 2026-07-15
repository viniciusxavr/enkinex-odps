schema CustomProperty:
    """
    A key/value pair for custom properties.

    Attributes
    ----------
    property : str, required
        The name of the key. Names should be in camel case, the same as if they were permanent properties in the contract.
    value : any, required
        The value of the key.
    description : str, optional
        Optional description.
    """
    property: str
    value: any
    description?: str

