import re

with open("./eID4U_attributes_studies.xsd", "r") as x:
    atribs = re.findall('(?m)Type name="([^"]+)', x.read())
    atribs = [a.replace("Type", "") for a in atribs]
cuerpo = ""
for i,atrib in enumerate(atribs):
    cuerpo += f"""
    <entry key="{i+1}.NameUri">http://eidas.europa.eu/attributes/naturalperson/EidasAdditionalAttribute</entry>
    <entry key="{i+1}.FriendlyName">{atrib}</entry>
    <entry key="{i+1}.PersonType">NaturalPerson</entry>
    <entry key="{i+1}.Required">false</entry>
    <entry key="{i+1}.XmlType.NamespaceUri">http://www.w3.org/2001/XMLSchema</entry>
    <entry key="{i+1}.XmlType.LocalPart">string</entry>
    <entry key="{i+1}.XmlType.NamespacePrefix">xs</entry>
    <entry key="{i+1}.AttributeValueMarshaller">eu.eidas.auth.commons.attribute.impl.LiteralStringAttributeValueMarshaller</entry>
    """

archivo = f"""<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE properties SYSTEM "http://java.sun.com/dtd/properties.dtd">
<properties>
<comment>Dynamic attributes</comment>
{cuerpo}
</properties>"""

with open("saml-engine-additional-attributes.xml", "w") as a:
    a.write(archivo)