import common

schema Team(common.Taggable):
    r"""
    Team information.

    Attributes
    ----------
    name : str, optional
        Team name.
    description : str, optional
        Team description.
    members : [TeamMember], optional
        List of members.
    tags : Tags, optional
        A list of tags that may be assigned to the elements (object or property); the tags keyword may appear at any level. Tags may be used to better categorize an element. For example, `finance`, `sensitive`, `employee_record`.
    customProperties : [CustomProperty], optional
        Custom properties block.
    authoritativeDefinitions : [AuthoritativeDefinition], optional
        Authoritative definitions block.
    """
    name?: str
    description?: str
    members?: [TeamMember]

