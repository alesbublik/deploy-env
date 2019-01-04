#!/usr/bin/env python

import csv

from cookiecutter.main import cookiecutter


def get_cookiecutter_data(csv_filepath):
    data = []
    with open(csv_filepath, mode='r') as csv_file:
        csv_reader = csv.reader(csv_file, delimiter=',')
        line_count = 0
        for row in csv_reader:
            if line_count == 0:
                line_count += 1
                continue

            row = [i.strip() for i in row]
            row = [None if len(i) == 0 else i for i in row]

            checkout = None
            if row[1] is not None:
                checkout = row[1].strip()

            extra_context_dict = None
            if row[2] is not None:
                extra_context_list = [item.split('=') for item in row[2].split()]
                extra_context_dict = {key:value for (key, value) in extra_context_list}

            data.append(dict(template=row[0].strip(), checkout=checkout, extra_context=extra_context_dict))

    return data

def generate_cookiecutters(data):
    for item in data:
        cookiecutter(overwrite_if_exists=True, no_input=True, **item)

if __name__ == "__main__":
    data = get_cookiecutter_data('cookiecutters.csv')
    generate_cookiecutters(data)
