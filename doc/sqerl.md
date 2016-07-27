

# Module sqerl #
* [Function Index](#index)
* [Function Details](#functions)

<a name="index"></a>

## Function Index ##


<table width="100%" border="1" cellspacing="0" cellpadding="2" summary="function index"><tr><td valign="top"><a href="#encode-1">encode/1</a></td><td>Calls <code>encode(Val, true)</code>.</td></tr><tr><td valign="top"><a href="#sql-1">sql/1</a></td><td>Generate an iolist (a tree of strings and/or binaries)
for a literal SQL statement that corresponds to the Sqerl
structure.</td></tr><tr><td valign="top"><a href="#sql-2">sql/2</a></td><td>Similar to sql/1, but accepts a boolean parameter
indicating if the return value should be a single binary
rather than an iolist.</td></tr><tr><td valign="top"><a href="#unsafe_sql-1">unsafe_sql/1</a></td><td>Generate an iolist (a tree of strings and/or binaries)
for a literal SQL statement that corresponds to the Sqerl
structure.</td></tr><tr><td valign="top"><a href="#unsafe_sql-2">unsafe_sql/2</a></td><td>Similar to <code>unsafe_sql/1</code>, but accepts a boolean parameter
indicating if the return value should be a binary or an iolist.</td></tr></table>


<a name="functions"></a>

## Function Details ##

<a name="encode-1"></a>

### encode/1 ###

<pre><code>
encode(Val::term()) -&gt; binary()
</code></pre>
<br />

Calls `encode(Val, true)`.

<a name="sql-1"></a>

### sql/1 ###

<pre><code>
sql(Sqerl::term()) -&gt; iolist()
</code></pre>
<br />

Generate an iolist (a tree of strings and/or binaries)
for a literal SQL statement that corresponds to the Sqerl
structure. If the structure is invalid, this function would
crash.

This function does not allow writing literal `WHERE`, `LIMIT`
and other trailing clauses. To write such clauses,
call `unsafe_sql/1` or `unsafe_sql/2`.

<a name="sql-2"></a>

### sql/2 ###

<pre><code>
sql(Sqerl::term(), X2::boolean()) -&gt; binary() | iolist()
</code></pre>
<br />

Similar to sql/1, but accepts a boolean parameter
indicating if the return value should be a single binary
rather than an iolist.

<a name="unsafe_sql-1"></a>

### unsafe_sql/1 ###

<pre><code>
unsafe_sql(Sqerl::term()) -&gt; iolist()
</code></pre>
<br />

throws `{error, {unsafe_expression, Expr}}`

Generate an iolist (a tree of strings and/or binaries)
for a literal SQL statement that corresponds to the Sqerl
structure. If the structure is invalid, this function
throws an exception.

This function allows writing literal `WHERE`, `LIMIT`
and other trailing clauses, such as `{where, "a=" ++ Val}`,
or `"WHERE a=" ++ Str ++ " LIMIT 5"`.

Such clauses are unsafe because they expose you to SQL
injection attacks. When you use `unsafe_sql`, make sure to
quote all your strings using the `encode/1` function.

<a name="unsafe_sql-2"></a>

### unsafe_sql/2 ###

<pre><code>
unsafe_sql(Sqerl::term(), AsBinary::boolean()) -&gt; binary() | iolist()
</code></pre>
<br />

throws `{error, {unsafe_expression, Expr}}`

Similar to `unsafe_sql/1`, but accepts a boolean parameter
indicating if the return value should be a binary or an iolist.

