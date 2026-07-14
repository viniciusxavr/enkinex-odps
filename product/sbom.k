import regex
import common

schema Sbom:
    r"""
    Software Bill of Materials.

    Attributes
    ----------
    $type : str, optional, default is "external"
        Type of SBOM.
    url : str, required
        URL to the SBOM.
    """
    $type?: str = "external"
    url: str

    check:
        regex.match(url, common.urlPattern)

