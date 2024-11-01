import os
from yaml import SafeLoader

def getenv(loader, node):
    if isinstance(node, list):
        # If the node is a sequence, construct each item as an environment variable
        return [os.getenv(loader.construct_scalar(item)) for item in node.value]
    else:
        # If it's a scalar, treat it as a single environment variable
        return os.getenv(loader.construct_scalar(node))

def join(loader, node):
    seq = loader.construct_sequence(node)
    return os.path.join(*seq)

# Register constructors with SafeLoader
SafeLoader.add_constructor('tag:yaml.org,2002:python/object/apply:os.path.join', join)
SafeLoader.add_constructor('tag:yaml.org,2002:python/object/apply:os.getenv', getenv)