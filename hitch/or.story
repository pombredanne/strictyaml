Or validation:
  description: |
    StrictYAML can be directed to parse two different elements or
    blocks of YAML.

    If the first thing does not parse correctly, it attempts to
    parse the second. If the second does not parse correctly,
    it raises an exception.
  based on: strictyaml
  scenario:
    - Code: |
        from strictyaml import Map, Bool, Int, YAMLValidationError, load

        schema = Map({"a": Bool() | Int()})

    - Variable:
        name: valid_sequence_1
        value: 'a: yes'

    - Returns True: 'load(valid_sequence_1, schema) == {"a" : True}'

    - Variable:
        name: valid_sequence_2
        value: 'a: 5'

    - Returns True: 'load(valid_sequence_2, schema) == {"a" : 5}'

    - Variable:
        name: valid_sequence_3
        value: 'a: no'

    - Returns True: 'load(valid_sequence_3, schema) == {"a" : False}'

    - Variable:
        name: invalid_sequence_1
        value: 'a: A'

    - Raises Exception:
        command: load(invalid_sequence_1, schema)
        exception: |
          when expecting an integer
          found non-integer
            in "<unicode string>", line 1, column 1:
              a: A
               ^

    - Variable:
        name: invalid_sequence_2
        value: 'a: B'

    - Raises Exception:
        command: load(invalid_sequence_2, schema)
        exception: |
          when expecting an integer
          found non-integer
            in "<unicode string>", line 1, column 1:
              a: B
               ^

    - Variable:
        name: invalid_sequence_3
        value: 'a: 3.14'

    - Raises Exception:
        command: load(invalid_sequence_3, schema)
        exception: |
          when expecting an integer
          found non-integer
            in "<unicode string>", line 1, column 1:
              a: '3.14'
               ^
