#!/bin/bash
# GitHub SSH密钥设置脚本

echo "🔐 GitHub SSH密钥设置向导"
echo "=========================="

# 检查SSH密钥是否存在
if [ -f ~/.ssh/id_rsa.pub ]; then
    echo "✅ SSH密钥已存在"
    echo "公钥内容："
    cat ~/.ssh/id_rsa.pub
    echo ""
    echo "请将上面的公钥复制到GitHub: https://github.com/settings/ssh/new"
else
    echo "📝 生成SSH密钥"
    read -p "请输入您的邮箱地址: " email
    
    # 生成SSH密钥
    ssh-keygen -t rsa -b 4096 -C "$email" -f ~/.ssh/id_rsa -N ""
    
    echo "✅ SSH密钥已生成"
    echo "公钥内容："
    cat ~/.ssh/id_rsa.pub
    echo ""
    echo "请将上面的公钥复制到GitHub: https://github.com/settings/ssh/new"
fi

# 启动SSH代理
eval "$(ssh-agent -s)"

# 添加SSH密钥到代理
ssh-add ~/.ssh/id_rsa

echo ""
echo "🧪 测试SSH连接"
ssh -T git@github.com

echo ""
echo "🎉 SSH设置完成！"
echo ""
echo "📋 使用方法："
echo "1. 在项目目录中运行: git init"
echo "2. 添加文件: git add ."
echo "3. 提交更改: git commit -m 'Initial commit'"
echo "4. 添加远程仓库: git remote add origin git@github.com:用户名/仓库名.git"
echo "5. 推送代码: git push -u origin main"
echo ""
echo "💡 提示："
echo "- SSH密钥永久有效，无需定期更新"
echo "- 更安全，无需在URL中包含密码"
echo "- 首次连接需要确认GitHub的指纹"
