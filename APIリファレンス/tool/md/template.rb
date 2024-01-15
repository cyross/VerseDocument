class MarkdownTemplate
  TO_UPPER_LINK_LINE = "- [一つ上位へ移動](../main.md)"
  TO_TOP_LINK_LINE = "- [API リファレンスのトップに移動](/main.md)"
  TEMPLATE_LINES = <<'EOS'
# [[%%_FILETYPE_%%]]%%_FULLNAME_%%

%%_LINK_%%

---

%%_IMPORT_%%%%_DESC_%%%%_MEMBER_%%---

%%_LINK_%%
EOS
  IMPORT_LINES = <<'EOS'
## インポート方法

```verse
using { %%_PATH_%% }
```

EOS
  DESC_LINES = <<'EOS'
## 説明

%%_DESC_%%
EOS
  MEMBER_LINES = <<'EOS'
## メンバー

%% MEMBER_DATA %%
EOS
end
