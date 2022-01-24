module A
  refine Object do
  end
end

module B
  refine Object do
  end
end

using A
using B
p Module.used_modules
