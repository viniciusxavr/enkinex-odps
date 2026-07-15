import regex
import common

schema Sbom:
    """
    Software Bill of Materials.

    Attributes
    ----------
    $type : str, default is "external", optional
        Type of SBOM.
    url : str, required
        URL to the SBOM.
    """
    $type?: str = "external"
    url: str

    check:
        regex.match(url, common.urlPattern)

