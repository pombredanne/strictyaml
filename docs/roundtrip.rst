Roundtripped YAML
=================

Loaded YAML can be dumped out again and commments
should be preserved.

Loaded YAML can even be modified and dumped out again too.


commented_yaml
.. code-block:: yaml

  # Some comment
  
  a: x # value comment
  
  # Another comment
  b: y

with_integer
.. code-block:: yaml

  x: 1

modified_commented_yaml
.. code-block:: yaml

  # Some comment
  
  a: x # value comment
  
  # Another comment
  b: x

.. code-block:: python

  >>> from strictyaml import Map, Str, Int, YAMLValidationError, load
  >>> 
  >>> schema = Map({"a": Str(), "b": Str()})

.. code-block:: python

  >>> load(commented_yaml, schema).as_yaml() == commented_yaml
  True

.. code-block:: python

  >>> to_modify = load(commented_yaml, schema)
  >>> 
  >>> to_modify['b'] = 'x'

.. code-block:: python

  >>> to_modify.as_yaml() == modified_commented_yaml
  True

.. code-block:: python

  >>> load(with_integer, Map({"x": Int()})).as_yaml() == "x: 1\n"
  True

