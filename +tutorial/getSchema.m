function obj = getSchema
persistent schemaObject
if isempty(schemaObject)
    schemaObject = dj.Schema(dj.conn, 'tutorial', 'tutorial');
end
obj = schemaObject;
end
