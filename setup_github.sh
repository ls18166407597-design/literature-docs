#!/bin/bash
# GitHub推送设置脚本

echo "🚀 GitHub推送设置向导"
echo "=========================="

# 检查Git是否已安装
if ! command -v git &> /dev/null; then
    echo "❌ Git未安装，请先安装Git"
    echo "macOS: brew install git"
    echo "Windows: 下载Git for Windows"
    echo "Linux: sudo apt install git"
    exit 1
fi

echo "✅ Git已安装"

# 配置Git用户信息
echo ""
echo "📝 配置Git用户信息"
read -p "请输入您的GitHub用户名: " username
read -p "请输入您的邮箱地址: " email

git config --global user.name "$username"
git config --global user.email "$email"

echo "✅ Git用户信息已配置"

# 配置Personal Access Token
echo ""
echo "🔐 配置Personal Access Token"
echo "请访问: https://github.com/settings/tokens"
echo "创建新的token，选择'repo'权限"
read -p "请输入您的Personal Access Token: " token

# 配置Git凭据存储
git config --global credential.helper store

# 创建凭据文件
echo "https://$username:$token@github.com" > ~/.git-credentials

echo "✅ Personal Access Token已配置"

# 测试连接
echo ""
echo "🧪 测试GitHub连接"
if git ls-remote https://github.com/$username/test-repo.git &> /dev/null; then
    echo "✅ GitHub连接正常"
else
    echo "⚠️ 无法连接到GitHub，请检查token是否正确"
fi

echo ""
echo "🎉 设置完成！"
echo ""
echo "📋 使用方法："
echo "1. 在项目目录中运行: git init"
echo "2. 添加文件: git add ."
echo "3. 提交更改: git commit -m 'Initial commit'"
echo "4. 添加远程仓库: git remote add origin https://github.com/用户名/仓库名.git"
echo "5. 推送代码: git push -u origin main"
echo ""
echo "💡 提示："
echo "- Token有效期90天，到期后需要重新创建"
echo "- 凭据已保存，下次推送无需重新输入"
echo "- 如需修改配置，运行: git config --global --edit"
