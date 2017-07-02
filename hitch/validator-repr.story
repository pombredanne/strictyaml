Validator repr:
  based on: strictyaml
  description: |
    When repr(x) is called on validators it should print an
    executable representation of the object.
  scenario:
    - Run command: |
        import strictyaml as sy

    - Assert True: |
        repr(sy.Map({"a": sy.Int()})) == """Map({"a": Int()})"""

    - Assert True: |
        repr(sy.Map({sy.Optional("a"): sy.Int()})) == """Map({Optional("a"): Int()})"""

    - Assert True: |
        repr(sy.Seq(sy.Str())) == "Seq(Str())"

    - Assert True: |
        repr(sy.FixedSeq([sy.EmptyNone(), sy.EmptyDict(), sy.EmptyList()])) == "FixedSeq([EmptyNone(), EmptyDict(), EmptyList()])"

    - Assert True: |
        repr(sy.UniqueSeq(sy.Decimal())) == "UniqueSeq(Decimal())"

    - Assert True: |
        repr(sy.MapPattern(sy.Bool(), sy.Enum(["x", "y"]))) == """MapPattern(Bool(), Enum(['x', 'y']))"""

    - Assert True: |
        repr(sy.Seq(sy.Datetime() | sy.Any())) == "Seq(Datetime() | Any())"

    - Assert True: |
        repr(sy.Map({"x": sy.CommaSeparated(sy.Float())})) == 'Map({"x": CommaSeparated(Float())})'
