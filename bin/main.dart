// Challenge 1
// Longest Streak
// Create a function that takes an array of objects with date property and return the
// "longest streak" (i.e. number of consecutive days in a row).
//
// Example

//➞ 3

import 'dart:math';

int longestStreak(List<Map<String, String>> dates) {
  dates.sort((Map<String, String> date1, Map<String, String> date2) =>
      date1['date'].compareTo(date2['date']));
  int currentStreak = 1;
  int previousStreak = 0;
  for (int i = 0; i < dates.length; i++) {
    int diff = 0;
    if (i != dates.length - 1) {
      DateTime date1 = DateTime.parse(dates[i]['date']);
      DateTime date2 = DateTime.parse(dates[i + 1]['date']);
      diff = date2.difference(date1).inDays;
    }
    if (diff == 1) {
      currentStreak++;
    } else {
      previousStreak = max(previousStreak, currentStreak);
      currentStreak = 1;
    }
  }
  return previousStreak;
}

// Challenge 2
// This problem was asked by Microsoft.
//
// Given a dictionary as a list of words and a string made up of those words (no spaces),
// return the original sentence in a list. If there is more than one possible
// reconstruction, return any of them. If there is no possible reconstruction,
// then return null.
//
// For example, given the set of words 'quick', 'brown', 'the', 'fox', and the
// string "thequickbrownfox", you should return ['the', 'quick', 'brown', 'fox'].
//
// Given the set of words 'bed', 'bath', 'bedbath', 'and', 'beyond', and the
// string "bedbathandbeyond", return either ['bed', 'bath', 'and', 'beyond] or
// ['bedbath', 'and', 'beyond'].
List<String> getList(String word, List<String> dict, int start) {
  if (start == word.length) {
    return [];
  }
  int end = start;
  List<String> output = [];
  while (end != word.length) {
    if (dict.contains(word.substring(start, end + 1))) {
      List<String> temp = getList(word, dict, end + 1);
      if (temp != null) {
        output.add(word.substring(start, end + 1));
        output.addAll(temp);
        return output;
      }
    }
    end++;
  }
  return null;
}

void main() {
  print(getList("andbedbathandbeyond",
      ['bed', 'bat', 'bedbat', 'bedbath', 'and', 'beyond'], 0));
  print(getList("bedbathandbeyondeverything",
      ['bedbath', 'bed', 'bath', 'bedbath', 'and', 'beyond'], 0));
  print(getList("thequickbrownfoxthe",
      ['the', 'quick', 'brown', 'fox'], 0));

//  print(longestStreak([
//    {"date": "2019-09-19"},
//    {"date": "2019-09-18"},
//    {"date": "2019-09-20"},
//    {"date": "2019-09-26"},
//    {"date": "2019-09-27"},
//    {"date": "2019-09-30"}
//  ]));
}
