#!/usr/bin/env python3
import xml.etree.ElementTree as etree


def parse_vcard(f):
    with f:
        root = etree.parse(f).getroot()

    description_el = root.find("note")
    if description_el:
        description = description_el.find("text").text
    else:
        description = None

    admin_el = root.find("impp")
    if admin_el:
        admin = admin_el.find("uri").text
    else:
        admin = None

    return {
        "server_name": root.find("fn").find("text").text,
        "founded": root.find("bday").find("date").text,
        "description": description,
        "url": root.find("url").find("uri").text,
        "admin": admin,
        "country": root.find("adr").find("country").text,
    }


OUTER_TEMPLATE = """\
INSERT INTO public_servers (
    server_name, founded, country, url, description, admin
) VALUES
    {}
;"""


INNER_TEMPLATE = """\
({server_name}, {founded}, {country}, {url}, {description}, {admin})\
"""


def to_sql(v):
    if v is None:
        return "NULL"

    return "E'{}'".format(
        "".join("\\x{:02x}".format(b) for b in v.encode("utf-8"))
    )


def dict_to_sql(d):
    return {
        key: to_sql(value)
        for key, value in d.items()
    }


if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser()
    parser.add_argument(
        "vcards",
        nargs="+",
        type=argparse.FileType("rb"),
        help="vCard(s) to convert to SQL",
    )

    args = parser.parse_args()

    vcards = list(map(parse_vcard, args.vcards))
    sql_vcards = [
        dict_to_sql(vcard)
        for vcard in vcards
    ]

    print(OUTER_TEMPLATE.format(
        ",\n    ".join(
            INNER_TEMPLATE.format(**sql_vcard)
            for sql_vcard in sql_vcards
        )
    ))
