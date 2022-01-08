abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class ChangeNavigationBarState extends NewsStates {}

class NewsLoadingsState extends NewsStates {}

class NewsBusinessSuccessfulState extends NewsStates {}

class NewsBusinessErrorState extends NewsStates {
  NewsBusinessErrorState(error);
}

class NewsSportsLoadingsState extends NewsStates {}

class NewsSportsSuccessfulState extends NewsStates {}

class NewsSportsErrorState extends NewsStates {
  NewsSportsErrorState(error);
}

class NewsScienceLoadingsState extends NewsStates {}

class NewsScienceSuccessfulState extends NewsStates {}

class NewsScienceErrorState extends NewsStates {
  NewsScienceErrorState(error);
}

class NewsChangeAppModeState extends NewsStates {}
