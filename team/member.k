import regex
import common

schema TeamMember(common.TagsDiscoverable):
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
        The date when the user joined the team, using the ISO 8601 date format (YYYY-MM-DD).
    dateOut : str, optional
        The date when the user ceased to be part of the team, using the ISO 8601 date format (YYYY-MM-DD).
    replacedByUsername : str, optional
        The username of the user who replaced the previous user.
    tags : Tags, optional
        A list of tags that may be assigned to the elements (object or property); the tags keyword may appear at any level. Tags may be used to better categorize an element. For example, `finance`, `sensitive`, `employee_record`.
    customProperties : [CustomProperty], optional
        A list of key/value pairs for custom properties.
    authoritativeDefinitions : [AuthoritativeDefinition], optional
        List of links to sources that provide more details on the data contract.
    """
    username: str
    name?: str
    description?: str
    role?: str
    dateIn?: str
    dateOut?: str
    replacedByUsername?: str

    check:
        regex.match(dateIn, common.datePattern) if dateIn
        regex.match(dateOut, common.datePattern) if dateOut

