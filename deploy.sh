#!/bin/bash
# 一键部署到GitHub脚本

echo "🚀 开始部署到GitHub..."

# 检查Git状态
if [ ! -d ".git" ]; then
    echo "❌ 不是Git仓库，请先运行 python 一键部署到Colab.py"
    exit 1
fi

# 添加所有文件
echo "📁 添加文件到Git..."
git add .

# 提交更改
echo "💾 提交更改..."
git commit -m "Update documents and training notebooks - $(date)"

# 检查远程仓库
if ! git remote get-url origin > /dev/null 2>&1; then
    echo "🔗 请先设置远程仓库："
    echo "git remote add origin https://github.com/YOUR_USERNAME/literature-docs.git"
    echo "然后运行：git push -u origin main"
else
    echo "🚀 推送到GitHub..."
    git push origin main
    echo "✅ 部署完成！"
    echo "🔗 您的仓库地址："
    git remote get-url origin
fi
