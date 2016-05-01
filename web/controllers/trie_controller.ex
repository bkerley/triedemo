defmodule Triedemo.TrieController do
  use Triedemo.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def format(conn, %{"trie_form" => %{"trie" => trie_words}} = _params) do
    trie = trie_words
    |> String.split("\n")
    |> Enum.map(fn(w) -> String.strip w end)
    |> Enum.reduce(%Trietest{}, fn(w, t) -> Trietest.add_word(t, w) end)

    trie_struct = trie
    |> Inspect.Algebra.to_doc(%Inspect.Opts{})
    |> Inspect.Algebra.format(80)

    graphviz = trie
    |> Trietest.to_dot

    render(conn, "format.html",
           trie_words: trie_words,
           trie_struct: trie_struct,
           graphviz: graphviz)
  end
end
