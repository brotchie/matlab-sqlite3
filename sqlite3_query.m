function [Result] = sqlite3_query(hConnection, query, varargin)

assert(mod(length(varargin), 2) == 0, 'Additional arguments to sqlite3_query must come in pairs.');

for ii = 1:2:length(varargin)
    query = strrep(query, ['{' varargin{ii} '}'], varargin{ii+1});
end

cursor = exec(hConnection, query);
cursor = fetch(cursor);
Result = cursor.Data;
%Result = fetch(hConnection, query);
