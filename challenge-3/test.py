def get_value_from_nested_object(obj, key):
    
    # Split the key by '/' to handle nested keys and since the key is in a format like 'a/b/c'
    keys = key.split('/')  
    
    # Traverse through the nested object
    current_obj = obj
    for k in keys:
        if isinstance(current_obj, dict) and k in current_obj:
            current_obj = current_obj[k]
        else:
            return None  # Key not found
    
    return current_obj

# Given nested object and key
#obj = {"a": {"b": {"c": "d"}}}
#key = "a/b/c"
obj = {"x":{"y":{"z":"a"}}}
key = "x/y/z"
# Retrieve the value using the function
value = get_value_from_nested_object(obj, key)
print(f"The value of '{key}' is: {value}")