Mapping validation
==================

nested
.. code-block:: yaml

  a: 1
  b: 2
  c:
    x: 1
    y: 2

valid_sequence
.. code-block:: yaml

  a: 1
  b: 2
  c: 3

.. code-block:: python

  >>> from strictyaml import Map, Int, YAMLValidationError, load
  >>> 
  >>> schema = Map({"a": Int(), "b": Int(), "c": Int()})
  >>> 
  >>> nested_schema = Map({"a": Int(), "b": Int(), "c": Map({"x": Int(), "y": Int()})})

.. code-block:: python

  >>> load(valid_sequence, schema) == {"a": 1, "b": 2, "c": 3}
  True

.. code-block:: python

  >>> "a" in load(valid_sequence, schema)
  True

.. code-block:: python

  >>> load(valid_sequence, schema).items() == [("a", 1), ("b", 2), ("c", 3)]
  True

.. code-block:: python

  >>> load(valid_sequence, schema).values() == [1, 2, 3]
  True

.. code-block:: python

  >>> load(valid_sequence, schema).keys() == ["a", "b", "c"]
  True

.. code-block:: python

  >>> load(valid_sequence, schema)["a"] == 1
  True

.. code-block:: python

  >>> load(valid_sequence, schema).get("a") == 1
  True

.. code-block:: python

  >>> load(valid_sequence, schema).get("nonexistent") is None
  True

.. code-block:: python

  >>> len(load(valid_sequence, schema)) == 3
  True

.. code-block:: python

  >>> load(valid_sequence, schema).is_mapping()
  True

.. code-block:: python

  >>> unmodified = load(nested, nested_schema)
  >>> modified = unmodified.copy()
  >>> 
  >>> modified['b'] = unmodified['c']

.. code-block:: python

  >>> modified == {"a": 1, "b": {"x": 1, "y": 2}, "c": {"x": 1, "y": 2}}
  True

