import os
import re
atribs = []
for xsd in os.listdir("./"):
    if xds.endswith(".xsd"):
        with open(xsd, "r") as x:
            nombres = re.findall("(?m)<simplename>\s?([^<]+)", x.read())
            atribs += nombres
print(atribs)
cuerpo = ""
for i,atrib in enumerate(atribs):
    cuerpo += f"""
    <entry key="{i}.NameUri">http://eidas.europa.eu/attributes/naturalperson/EidasAdditionalAttribute</entry>
<entry key="{i}.FriendlyName">Atrib</entry>
<entry key="{i}.Required">false</entry>
<entry key="{i}.XmlType.NamespaceUri">http://www.w3.org/2001/XMLSchema</entry>
<entry key="{i}.XmlType.LocalPart">string</entry>
<entry key="{i}.XmlType.NamespacePrefix">xs</entry>
<entry key="{i}.AttributeValueMarshaller">eu.eidas.auth.commons.attribute.impl.LiteralStringAttributeValueMarshaller</entry>"""

archivo = f"""<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE properties SYSTEM "http://java.sun.com/dtd/properties.dtd">
<properties>
<comment>Dynamic attributes</comment>
{cuerpo}
</properties>"""

with open("saml-engine-additional-attributes.xml", "w") as a:
    a.write(archivo)