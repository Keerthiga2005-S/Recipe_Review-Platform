from django.shortcuts import render, get_object_or_404, redirect
from .models import Recipe
from .forms import RecipeForm, ReviewForm

def recipe_list(request):
    recipes = Recipe.objects.all()
    return render(request, 'recipes/recipe_list.html', {'recipes': recipes})

def recipe_detail(request, pk):
    recipe = get_object_or_404(Recipe, pk=pk)
    if request.method == 'POST':
        form = ReviewForm(request.POST)
        if form.is_valid():
            review = form.save(commit=False)
            review.recipe = recipe
            review.save()
            return redirect('recipe_detail', pk=recipe.pk)
    else:
        form = ReviewForm()
    return render(request, 'recipes/recipe_detail.html', {'recipe': recipe, 'form': form})

def add_recipe(request):
    if request.method == 'POST':
        form = RecipeForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return redirect('recipe_list')
    else:
        form = RecipeForm()
    return render(request, 'recipes/add_recipe.html', {'form': form})
