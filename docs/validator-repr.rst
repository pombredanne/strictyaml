Validator repr
==============

When repr(x) is called on validators it should print an
executable representation of the object.


.. code-block:: python

  >>> import strictyaml as sy

.. code-block:: python

  >>> repr(sy.Map({"a": sy.Int()})) == """Map({"a": Int()})"""
  True

.. code-block:: python

  >>> repr(sy.Map({sy.Optional("a"): sy.Int()})) == """Map({Optional("a"): Int()})"""
  True

.. code-block:: python

  >>> repr(sy.Seq(sy.Str())) == "Seq(Str())"
  True

.. code-block:: python

  >>> repr(sy.FixedSeq([sy.EmptyNone(), sy.EmptyDict(), sy.EmptyList()])) == "FixedSeq([EmptyNone(), EmptyDict(), EmptyList()])"
  True

.. code-block:: python

  >>> repr(sy.UniqueSeq(sy.Decimal())) == "UniqueSeq(Decimal())"
  True

.. code-block:: python

  >>> repr(sy.MapPattern(sy.Bool(), sy.Enum(["x", "y"]))) == """MapPattern(Bool(), Enum(['x', 'y']))"""
  True

.. code-block:: python

  >>> repr(sy.Seq(sy.Datetime() | sy.Any())) == "Seq(Datetime() | Any())"
  True

