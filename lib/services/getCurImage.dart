String getCurImage(weatherName) {
  switch (weatherName.toString()) {
    case 'Sun':
      return 'Sun';
      break;
    case 'Clear':
      return 'Sun';
      break;
    case 'Fog':
      return 'Mist';
      break;
    case 'Mist':
      return 'Mist';
      break;
    case 'Rain':
      return 'Rain';
      break;
    case 'Snow':
      return 'Snow';
      break;
    case 'Clouds':
      return 'Clouds';
    default:
      return 'Sun';
  }
}
