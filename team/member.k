import common

schema TeamMember:
    r"""
    Team member information.

    Attributes
    ----------
    username : str, required
        The user's username or email.
    name : str, optional
        The user's name.
    description : str, optional
        The user's description.
    role : str, optional
        The user's job role; Examples might be owner, data steward. There is no limit on the role.
    dateIn : str, optional
        The date when the user joined the team.
    dateOut : str, optional
        The date when the user ceased to be part of the team.
    replacedByUsername : str, optional
        The username of the user who replaced the previous user.
    tags : [str], optional
        A list of tags that may be assigned to the elements (object or property); the tags keyword may appear at any level. Tags may be used to better categorize an element. For example, `finance`, `sensitive`, `employee_record`.
    customProperties : [CustomProperty], optional
        Custom properties block.
    authoritativeDefinitions : [AuthoritativeDefinition], optional
        Authoritative definitions block.
    """

    username: str
    name?: str
    description?: str
    role?: str
    dateIn?: str
    dateOut?: str
    replacedByUsername?: str
    tags?: [str]
    customProperties?: [common.CustomProperty]
    authoritativeDefinitions?: [common.AuthoritativeDefinition]