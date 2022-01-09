# Divine-Travel-Assist-Macro

Calculate the coordinates of Fossil Divine Travel and the nearest coordinates.

ネザーの化石を使ったDivine Travelの座標と、現在地からの最寄りの座標を計算します。 
デフォルトではCtrl+Dで起動します。起動すると、化石のX座標を選択するGUIが開かれます。
X座標を選択したらクリップボードに対応した座標を貼り付けます。

F3+Cを使っていると、F3+Cで取得した座標からの最寄りの座標を貼り付けます。
F3+Cを使っていないと、対応した座標の3つを貼り付けます。 また、クリップボードに張り付けるタイプが複数あり、Safe CoordとHighroll Coordの両方、Safe Coordのみ、Highroll Coordのみです。
コード内でF3ResultTypeと、NormalResultTypeの値を1にするとSafe CoordとHighroll Coordの両方、2にするとSafe Coordのみ、3にするとHighroll Coordのみです。
F3ResultTypeはF3+Cを使ったとき、NormalResultTypeはF3+Cを使っていないときです。 
さらにF3SafeHighDisplayと、NormalSafeHighDisplayの値をTrueにすると、視覚的にわかりやすくするために、クリップボードに張り付けられる座標にSafeとHighの文字を入れます。
TrueではなくFalseにすると無効化されます。 
F3SafeHighDisplayはF3+Cを使ったとき、NormalSafeHighDisplayはF3+Cを使っていないときです。

また、Ninjabrain Botを起動した状態でF3+Cを押すと、Ninjabrain Botを操作してしまうため、F3+Cを押してからマクロを使った際にNinjabrain Botの操作を取り消すオプションがあります。 NinbHotKeyの内容を、Ninjabrain BotのUndoかResetのホットキーにすると操作が取り消されます。取り消さない場合は空白にしてください。

2022/1/10時点ではSpeedRunのルールに違反していません。 ですが、本マクロは正式に使用が認められているわけではありませんのでご注意ください。