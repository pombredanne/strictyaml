Enum validation (Enum)
----------------------

StrictYAML allows you to ensure that a scalar
value can only be one of a set number of items.

It will throw an exception if any strings not
in the list are found.

.. code-block:: python

    from strictyaml import Map, Enum, MapPattern, YAMLValidationError, load
    
    schema = Map({"a": Enum(["A", "B", "C"])})

With variable 'valid_sequence_1':

.. code-block:: yaml

  a: A



.. code-block:: python

    load(valid_sequence_1, schema) == {"a": "A"}
    >>> True

With variable 'valid_sequence_2':

.. code-block:: yaml

  a: B



.. code-block:: python

    load(valid_sequence_2, schema) == {"a": "B"}
    >>> True

With variable 'valid_sequence_3':

.. code-block:: yaml

  a: C



.. code-block:: python

    load(valid_sequence_3, schema) == {"a": "C"}
    >>> True

With variable 'invalid_sequence_1':

.. code-block:: yaml

  a: D



.. code-block:: python

    load(invalid_sequence_1, schema)
    >>> EXCEPTION RAISED:
      

With variable 'invalid_sequence_2':

.. code-block:: yaml

  a: yes



.. code-block:: python

    load(invalid_sequence_2, schema)
    >>> EXCEPTION RAISED:
      

With variable 'invalid_sequence_3':

.. code-block:: yaml

  a: 1



.. code-block:: python

    load(invalid_sequence_3, schema)
    >>> EXCEPTION RAISED:
      


Page automatically generated by hitchdoc from:
  hitch/enum.story