# 文献检索系统文档

## 📁 文档列表
- Instagram.docx
- Instagram_.docx
- docx
- InstagramTikTok.docx

## 🚀 在Google Colab中使用

1. 打开 [Google Colab](https://colab.research.google.com/)
2. 创建新笔记本
3. 运行以下代码：

```python
# 克隆仓库
!git clone https://github.com/YOUR_USERNAME/literature-docs.git
!cd literature-docs

# 查看文档
import os
doc_files = os.listdir('literature-docs/documents')
print(f"找到 {len(doc_files)} 个文档:")
for file in doc_files:
    print(f"  - {file}")
```

## 📊 训练模型

运行 `notebooks/colab_training.ipynb` 开始训练。

## 📝 更新说明

最后更新: 2025-09-18 23:42:46
