require rubygems
require rubygems/source_info_cache_entry
require rubygems/user_interaction

個々の Gem パッケージのインデックス情報のコピーを保存するためのライブラリです。

= class Gem::SourceInfoCache
include Gem::UserInteraction

個々の Gem パッケージのインデックス情報のコピーを保存するためのクラスです。

キャッシュの保存場所として以下の二つが存在します。

: システムキャッシュ
  ファイルに対する書き込み権限や作成権限がある場合はこちらを使用します。
: ユーザーキャッシュ
  システムキャッシュが使用できない場合に使用します。

使用するキャッシュを選択すると、全ての操作で選択されたキャッシュを使用します。
また、このクラスは動的にキャッシュの種類を切り替えません。

キャッシュデータはキーが取得元の URI で値が [[c:SourceInfoCacheEntry]] のインスタンスであるハッシュです。

== Public Instance Methods

--- cache_data -> Hash
#@todo

最新のキャッシュデータを返します。

--- cache_file -> String
#@todo

使用可能なキャッシュファイル名を返します。

システムキャッシュが使用可能な場合はシステムキャッシュのファイル名を返します。
そうでない場合はユーザーキャッシュのファイル名を返します。

--- flush -> false
#@todo

キャッシュをローカルファイルに書き込みます。

--- latest_cache_data -> Hash
#@todo

最新のキャッシュデータを返します。

--- latest_cache_file -> String
#@todo

使用可能な最新のキャッシュファイル名を返します。

システムキャッシュが使用可能な場合はシステムキャッシュのファイル名を返します。
そうでない場合はユーザーキャッシュのファイル名を返します。

@see [[m:Gem::SourceInfoCache#cache_file]]

--- latest_system_cache_file -> String
#@todo

最新のシステムキャッシュのファイル名を返します。

--- latest_user_cache_file -> String
#@todo

最新のユーザーキャッシュのファイル名を返します。

--- read_all_cache_data -> ()
#@todo

自身に完全なキャッシュファイルの内容をマージします。

--- read_cache_data(file) -> Hash
#@todo

与えられたファイル名からデータを読み込んでキャッシュデータを返します。

@param file キャッシュのファイル名を指定します。

@return 内部で例外が発生した場合は、空のハッシュを返します。

--- refresh(all) -> false
#@todo

取得元ごとにキャッシュデータを更新します。

@param all 真を指定すると全てのキャッシュを更新します。そうでない場合は、
           最新の Gem パッケージの情報のみ更新します。

--- reset_cache_data -> true
#@todo

キャッシュデータをリセットします。

--- reset_cache_file -> nil
#@todo

強制的にキャッシュファイル名をリセットします。

RubyGems ライブラリの結合テストをするのに便利です。

--- reset_cache_for(url, cache_data) -> Hash
#@todo

指定された URL に対応するキャッシュデータを更新します。

@param url 取得元 URL を指定します。

@param cache_data キャッシュデータを指定します。　

--- search(pattern, platform_only = false, all = false) -> [Gem::Specification]
#@todo

与えられた条件を満たす [[c:Gem::Specification]] のリストを返します。

@param pattern 検索したい Gem を表す [[c:Gem::Dependency]] のインスタンスを指定します。

@param platform_only 真を指定するとプラットフォームが一致するもののみを返します。デフォルトは偽です。

@param all 真を指定するとキャッシュを更新してから検索を実行します。

@see [[m:Gem::SourceIndex#search]]

--- search_with_source(pattern, only_platform = false, all = false) -> Array
#@todo

与えられた条件を満たす [[c:Gem::Specification]] と URL のリストを返します。

@param pattern 検索したい Gem を表す [[c:Gem::Dependency]] のインスタンスを指定します。

@param only_platform 真を指定するとプラットフォームが一致するもののみを返します。デフォルトは偽です。

@param all 真を指定するとキャッシュを更新してから検索を実行します。

@return 第一要素を [[c:Gem::Specification]]、第二要素を取得元の URL とする配列を要素とする配列を返します。


--- set_cache_data(hash) -> true
#@todo

直接キャッシュデータをセットします。

このメソッドは主にユニットテストで使用します。

@param hash キャッシュデータとして使用するハッシュを指定します。

--- system_cache_file -> String
#@todo

システムキャッシュファイルの名前を返します。

--- try_file(path) -> String | nil
#@todo

与えられたパスがキャッシュファイルとして利用可能な場合、そのパスを返します。
そうでない場合は nil を返します。

@param path キャッシュファイルの候補となるパスを指定します。

--- update -> true
#@todo

キャッシュが更新されたことをマークします。更新自体はは行いません。

--- user_cache_file -> String
#@todo

ユーザーキャッシュのファイル名を返します。

--- write_cache -> nil
#@todo

適切なキャッシュファイルにキャッシュデータを書き込みます。

== Singleton Methods

--- cache(all = false) -> Gem::SourceInfoCache
#@todo

自身のインスタンスを生成するためのメソッドです。

@param all 真を指定すると、インスタンス生成時に全てのキャッシュを再作成します。

--- cache_data -> Hash
#@todo

キャッシュしているデータを返します。

--- latest_system_cache_file -> String
#@todo

最新のシステムキャッシュのファイル名を返します。

--- latest_user_cache_file -> String
#@todo

最新のユーザーキャッシュのファイル名を返します。

--- reset -> nil
#@todo

自身の内容をクリアします。

--- search(*args) -> [Gem::Specification]
#@todo

与えられた条件を満たす [[c:Gem::Specification]] のリストを返します。

@param args 検索条件を指定します。[[m:Gem::SourceInfoCache#search]] と引数を合わせてください。

@see [[m:Gem::SourceInfoCache#search]]

--- search_with_source(*args) -> Array
#@todo

与えられた条件を満たす [[c:Gem::Specification]] と URL のリストを返します。

@param args 検索条件を指定します。[[m:Gem::SourceInfoCache#search_with_source]] と引数を合わせてください。

@see [[m:Gem::SourceInfoCache#search_with_source]]

--- system_cache_file -> String
#@todo

システムキャッシュのファイル名を返します。

--- user_cache_file -> String
#@todo

ユーザーキャッシュのファイル名を返します。
