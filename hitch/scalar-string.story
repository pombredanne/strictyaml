Scalar strings:
  based on: strictyaml
  description: |
    StrictYAML parses to a YAML object, not
    the value directly to give you more flexibility
    and control over what you can do with the YAML.
    
    This is what that can object can do - in most
    cases if parsed as a string, it will behave in
    the same way.
  scenario:
    - Code: |
        from strictyaml import Str, Map, load

        schema = Map({"a": Str(), "b": Str(), "c": Str(), "d": Str()})

    - Variable:
        name: valid_sequence
        value: |
          a: 1
          b: yes
          c: â string
          d: |
            multiline string

    - Returns True: 'load(valid_sequence, schema) == {"a": "1", "b": "yes", "c": u"â string", "d": "multiline string\n"}'

    - Returns True: str(load(valid_sequence, schema)["a"]) == "1"

    - Returns True: int(load(valid_sequence, schema)["a"]) == 1

    - Raises Exception:
        command: bool(load(valid_sequence, schema)["a"])
        exception: Cannot cast

