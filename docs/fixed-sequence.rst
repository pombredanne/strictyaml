Fixed length sequence validation
================================

Sequences can have multiple different types of within them
provided they are of a fixed length.


invalid_sequence_2
.. code-block:: yaml

  - 2
  - a
  - a:
    - 1
    - 2

invalid_sequence_1
.. code-block:: yaml

  a: 1
  b: 2
  c: 3

valid_sequence
.. code-block:: yaml

  - 1
  - a
  - 2.5

invalid_sequence_3
.. code-block:: yaml

  - 1
  - a

.. code-block:: python

  >>> from strictyaml import FixedSeq, Str, Int, Float, YAMLValidationError, load
  >>> 
  >>> schema = FixedSeq([Int(), Str(), Float()])

.. code-block:: python

  >>> load(valid_sequence, schema) == [1, "a", 2.5, ]
  True

.. code-block:: python

  >>> load(invalid_sequence_1, schema)
  EXCEPTION RAISED:
  when expecting a sequence of 3 elements
    in "<unicode string>", line 1, column 1:
      a: '1'
       ^ (line: 1)
  found non-sequence
    in "<unicode string>", line 3, column 1:
      c: '3'
      ^ (line: 3)

.. code-block:: python

  >>> load(invalid_sequence_2, schema)
  EXCEPTION RAISED:
  when expecting a float
    in "<unicode string>", line 3, column 1:
      - a:
      ^ (line: 3)
  found mapping/sequence
    in "<unicode string>", line 5, column 1:
        - '2'
      ^ (line: 5)

.. code-block:: python

  >>> load(invalid_sequence_3, schema)
  EXCEPTION RAISED:
  when expecting a sequence of 3 elements
    in "<unicode string>", line 1, column 1:
      - '1'
       ^ (line: 1)
  found a sequence of 2 elements
    in "<unicode string>", line 2, column 1:
      - a
      ^ (line: 2)

