#!/bin/bash
# 快速推送脚本 - 适用于任何项目

echo "🚀 快速GitHub推送工具"
echo "====================="

# 检查是否在Git仓库中
if [ ! -d ".git" ]; then
    echo "❌ 当前目录不是Git仓库"
    echo "正在初始化Git仓库..."
    git init
    echo "✅ Git仓库已初始化"
fi

# 获取仓库信息
read -p "请输入GitHub用户名: " username
read -p "请输入仓库名称: " repo_name
read -p "请输入提交信息 (默认: 'Update project'): " commit_msg

# 设置默认提交信息
if [ -z "$commit_msg" ]; then
    commit_msg="Update project"
fi

echo ""
echo "📋 推送信息："
echo "  用户名: $username"
echo "  仓库名: $repo_name"
echo "  提交信息: $commit_msg"
echo ""

# 确认推送
read -p "确认推送？(y/n): " confirm
if [ "$confirm" != "y" ]; then
    echo "❌ 取消推送"
    exit 1
fi

# 添加所有文件
echo "📁 添加文件到Git..."
git add .

# 提交更改
echo "💾 提交更改..."
git commit -m "$commit_msg"

# 检查远程仓库
if ! git remote get-url origin > /dev/null 2>&1; then
    echo "🔗 添加远程仓库..."
    git remote add origin https://github.com/$username/$repo_name.git
else
    echo "✅ 远程仓库已存在"
fi

# 推送到GitHub
echo "🚀 推送到GitHub..."
git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "🎉 推送成功！"
    echo "🔗 仓库地址: https://github.com/$username/$repo_name"
else
    echo ""
    echo "❌ 推送失败"
    echo "💡 可能的原因："
    echo "  - 仓库不存在，请先在GitHub上创建"
    echo "  - 身份验证失败，请检查token或SSH密钥"
    echo "  - 网络连接问题"
fi
