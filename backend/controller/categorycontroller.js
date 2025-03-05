const Category = require('../model/Category'); // Import the Category model

// CREATE a new category
module.exports.createCategory = async (req, res) => {
  try {
    const { name, description } = req.body;

    // Basic validation
    if (!name || !description) {
      return res.status(400).json({ message: 'Name and description are required' });
    }

    const category = new Category({ name, description });
    await category.save();
    res.status(201).json({
      message: 'Category created successfully',
      category,
    });
  } catch (error) {
    res.status(400).json({ message: 'Error creating category', error });
  }
};

// READ all categories
module.exports.getAllCategories = async (req, res) => {
  try {
    const categories = await Category.find();
    res.status(200).json(categories);
  } catch (error) {
    res.status(500).json({ message: 'Error retrieving categories', error });
  }
};

// READ a single category by ID
module.exports.getCategoryById = async (req, res) => {
  try {
    const category = await Category.findById(req.params.id);
    if (!category) {
      return res.status(404).json({ message: 'Category not found' });
    }
    res.status(200).json(category);
  } catch (error) {
    res.status(500).json({ message: 'Error retrieving category', error });
  }
};

// UPDATE a category by ID
module.exports.updateCategory = async (req, res) => {
  try {
    const { name, description } = req.body;

    // Basic validation
    if (!name || !description) {
      return res.status(400).json({ message: 'Name and description are required' });
    }

    const category = await Category.findByIdAndUpdate(
      req.params.id,
      { name, description },
      { new: true, runValidators: true }
    );

    if (!category) {
      return res.status(404).json({ message: 'Category not found' });
    }

    res.status(200).json({
      message: 'Category updated successfully',
      category,
    });
  } catch (error) {
    res.status(400).json({ message: 'Error updating category', error });
  }
};

// DELETE a category by ID
module.exports.deleteCategory = async (req, res) => {
  try {
    const category = await Category.findByIdAndDelete(req.params.id);
    if (!category) {
      return res.status(404).json({ message: 'Category not found' });
    }
    res.status(200).json({ message: 'Category deleted successfully' });
  } catch (error) {
    res.status(500).json({ message: 'Error deleting category', error });
  }
};