require "csv" # CSVファイルを扱うためのライブラリを読み込んでいます

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"

memo_type = gets.to_s # ユーザーの入力値を取得し、数字へ変換しています

# if文を使用して続きを作成していきましょう。
# 「memo_type」の値（1 or 2）によって処理を分岐させていきましょう。

input_number = memo_type.chomp

if input_number == "1"
    puts "拡張子を除いたファイル名を入力してください。"
    file_name = gets.chomp
    
    puts"メモの内容を記入してenter押下して下さい。" 
    puts"その後Ctrl+Dを押すと保存します。"
    imput_memo = STDIN.read
    memo = imput_memo.chomp
    
    CSV.open("#{file_name}.csv" , "w") do |csv|
    csv.puts ["#{memo}"]

  end
elsif input_number == "2"
    puts "修正するファイル名を入力してください"
    file_name = gets.chomp
    CSV.open("#{file_name}.csv", "a") do |csv|

    puts "編集内容を入力してenter押下して下さい。"
    puts "その後Ctrl+Dを押すと保存します。"
    imput_memo = STDIN.read
    memo = imput_memo.chomp
    csv.puts ["#{memo}"]
  end
  
    else
    puts "不正な値です。1か2の数字を入力してください"
    end

