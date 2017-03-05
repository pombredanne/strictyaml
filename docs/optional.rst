Optional validation
===================

invalid_sequence_2
.. code-block:: yaml

  a: 1
  b: 2

valid_sequence_3
.. code-block:: yaml

  a: 1

valid_sequence_2
.. code-block:: yaml

  a: 1
  b: no

valid_sequence_4
.. code-block:: yaml

  a: 1
  b:
    x: y
    y: z

invalid_sequence_1
.. code-block:: yaml

  b: 2

valid_sequence_1
.. code-block:: yaml

  a: 1
  b: yes

invalid_sequence_3
.. code-block:: yaml

  a: 1
  b: yes
  c: 3

.. code-block:: python

  >>> from strictyaml import Map, Int, Str, Bool, Optional, YAMLValidationError, load
  >>> 
  >>> schema = Map({"a": Int(), Optional("b"): Bool(), })

.. code-block:: python

  >>> load(valid_sequence_1, schema) == {"a": 1, "b": True}
  True

.. code-block:: python

  >>> load(valid_sequence_2, schema) == {"a": 1, "b": False}
  True

.. code-block:: python

  >>> load(valid_sequence_3, schema) == {"a": 1}
  True

.. code-block:: python

  >>> load(valid_sequence_4, Map({"a": Int(), Optional("b"): Map({Optional("x"): Str(), Optional("y"): Str()})}))

.. code-block:: python

  >>> load(invalid_sequence_1, schema)
  EXCEPTION RAISED:
  when expecting a boolean value (one of "yes", "true", "on", "1", "no", "false", "off", "0")
  found non-boolean
    in "<unicode string>", line 1, column 1:
      b: '2'
       ^

.. code-block:: python

  >>> load(invalid_sequence_2, schema)
  EXCEPTION RAISED:
  when expecting a boolean value (one of "yes", "true", "on", "1", "no", "false", "off", "0")
  found non-boolean
    in "<unicode string>", line 2, column 1:
      b: '2'
      ^

.. code-block:: python

  >>> load(invalid_sequence_3, schema)
  EXCEPTION RAISED:
  while parsing a mapping
  unexpected key not in schema 'c'
    in "<unicode string>", line 3, column 1:
      c: '3'
      ^

