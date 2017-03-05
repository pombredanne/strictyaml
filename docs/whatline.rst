What line
=========

Line and context can be determined from the returned YAML object.


commented_yaml
.. code-block:: yaml

  y: p
  # Some comment
  
  a: |
    x
  
  # Another comment
  b: y
  c: a
  d: b

.. code-block:: python

  >>> from strictyaml import Map, Str, YAMLValidationError, load
  >>> 
  >>> schema = Map({"y": Str(), "a": Str(), "b": Str(), "c": Str(), "d": Str()})

.. code-block:: python

  >>> load(commented_yaml, schema)["a"].start_line == 2
  True

.. code-block:: python

  >>> load(commented_yaml, schema)["a"].end_line == 7
  True

.. code-block:: python

  >>> load(commented_yaml, schema).keys()[1].start_line == 2
  True

.. code-block:: python

  >>> load(commented_yaml, schema).start_line == 1
  True

.. code-block:: python

  >>> load(commented_yaml, schema).end_line == 10
  True

.. code-block:: python

  >>> load(commented_yaml, schema)['a'].lines() == '# Some comment\n\na: |\n  x\n\n# Another comment'
  True

.. code-block:: python

  >>> load(commented_yaml, schema)['a'].lines_before(1) == "y: p"
  True

.. code-block:: python

  >>> load(commented_yaml, schema)['a'].lines_after(4) == "b: y\nc: a\nd: b\n"
  True

