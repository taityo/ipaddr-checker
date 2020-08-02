require "ipaddress"

def check_ipaddr(ipaddr)
    ipaddress = nil
    is_ipaddr = true
    validate = "OK"
    ip_type = nil

    # IPAddress Objectを作成
    begin
        ipaddress = IPAddress(ipaddr)
    rescue => error
        # 無効なIPAdressの場合エラーとなる
        is_ipaddr = false
        validate = error.message
    end

    # IPAddressの判定
    if is_ipaddr
        # private/globalの判定
        if ipaddress.private?
            ip_type = "Local"
        else
            ip_type = "Global"
        end
    end

    # バリデーション結果とglobal/localかどうかを返す
    # IPAdress出ない場合、ip_typeはnilになる
    return validate, ip_type
end

def main(argv)
    # 引数を取得
    file_name = argv[0]
    if file_name.nil?
        puts("Set file name to argment.")
        exit
    end

    # ファイルオブジェクトを定義
    File.open(file_name, "r") do |f|
        # 一行ずつ解析
        f.each_line{|line|
            ipaddr = line.strip
            validate, ip_type = check_ipaddr(ipaddr)

            puts("-------------------------")
            puts("Input IP : #{ipaddr}")
            puts("Validate : #{validate}")
            puts("Type : #{ip_type}")
        }
    end
    puts("-------------------------")
end

if __FILE__ == $0
    main(ARGV)
end