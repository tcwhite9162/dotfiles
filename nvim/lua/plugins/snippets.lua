return {
  "L3MON4D3/LuaSnip",
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
  config = function()
    local ls = require("luasnip")
    local s = ls.snippet
    local t = ls.text_node
    local i = ls.insert_node
    local fmt = require("luasnip.extras.fmt").fmt

    -- Load friendly-snippets
    require("luasnip.loaders.from_vscode").lazy_load()

    ----------------------------------------------------------------------
    -- Custom LaTeX snippet triggers (your preferred names)
    ----------------------------------------------------------------------
        ls.add_snippets("tex", {

        -- begin/end environment
        s("beg", fmt([[
        \begin{{{}}}
            {}
        \end{{{}}}
        ]], { i(1, "environment"), i(2), i(1) })),

        -- itemize
        s("itm", fmt([[
        \begin{{itemize}}
            \item{{{}}}
        \end{{itemize}}
        ]], { i(1) })),

        -- enumerate
        s("enum", fmt([[
        \begin{{enumerate}}
            \item{{{}}}
        \end{{enumerate}}
        ]], { i(1) })),

        -- prooftree
        s("ptree", fmt([[
        \begin{{prooftree}}
            \AxiomC{{${}$}}
            \RightLabel{{$$}}
            \UnaryInfC{{$$}}
        \end{{prooftree}}
        ]], { i(1) })),

        -- AxiomC
        s("axiom", fmt("\\AxiomC{{${}$}}", { i(1) })),

        -- RightLabel
        s("rlabel", fmt("\\RightLabel{{${}$}}", { i(1) })),

        -- UnaryInfC
        s("unary", fmt("\\UnaryInfC{{${}$}}", { i(1) })),

        -- BinaryInfC
        s("binary", fmt("\\BinaryInfC{{${}$}}", { i(1) })),


        s("tikz", fmt([[
        \begin{{tikzpicture}}[
            state/.style={{circle, draw, minimum size=1cm}},
            shorten >= 3pt,
            node distance=3cm,
            initial text={{\footnotesize start}},
            auto
            ]

            \node[state, initial] (A) at (0, 0) {{{}}};
            \node[state, accepting] (B) at (3, 0) {{{}}};

            \path[->] (A) edge node {{{}}} (B);

        \end{{tikzpicture}}
        ]], {
            i(1, "$A$"),
            i(2, "$B$"),
            i(3, "a"),
        })),



        -- bold
        s("bold", fmt("\\textbf{{{}}}", { i(1) })),

        -- emph
        s("emph", fmt("\\emph{{{}}}", { i(1) })),

        -- section
        s("sec", fmt("\\section*{{{}}}", { i(1) })),

        -- subsection
        s("ssec", fmt("\\subsection*{{{}}}", { i(1) })),

        -- subsubsection
        s("sssec", fmt("\\subsubsection*{{{}}}", { i(1) })),

        })
  end,
}
