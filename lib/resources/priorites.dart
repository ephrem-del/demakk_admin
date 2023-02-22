import '../objects/priority.dart';
import '../objects/priorityType.dart';

// List<Priority> priorities = <Priority>[
//   Priority(priorityType: PriorityType(name: 'Low', priorityLevel: 0)),
//   Priority(priorityType: PriorityType(name: 'Medium', priorityLevel: 1)),
//   Priority(priorityType: PriorityType(name: 'High', priorityLevel: 2)),
//   Priority(priorityType: PriorityType(name: 'very High', priorityLevel: 3)),
//   Priority(priorityType: PriorityType(name: 'Urgent', priorityLevel: 4))
// ];

Map<String, Priority> priorities = <String, Priority>{
  'low': Priority(
      priorityType:
          PriorityType(name: 'low', priorityLevel: 0, amharicName: 'ዝቅተኛ')),
  'medium': Priority(
      priorityType:
          PriorityType(name: 'medium', priorityLevel: 1, amharicName: 'መካከለኛ')),
  'high': Priority(
      priorityType:
          PriorityType(name: 'high', priorityLevel: 2, amharicName: 'ከፈተኛ')),
  'very high': Priority(
      priorityType: PriorityType(
          name: 'very high', priorityLevel: 3, amharicName: 'በጣም ከፍተኛ')),
  'urgent': Priority(
      priorityType:
          PriorityType(name: 'urgent', priorityLevel: 4, amharicName: 'አስቸኳይ')),
};

List<Priority> priorities2 = <Priority>[
  Priority(
      priorityType:
          PriorityType(name: 'low', priorityLevel: 0, amharicName: 'ዝቅተኛ')),
  Priority(
      priorityType:
          PriorityType(name: 'medium', priorityLevel: 1, amharicName: 'መካከለኛ')),
  Priority(
      priorityType:
          PriorityType(name: 'high', priorityLevel: 2, amharicName: 'ከፍተኛ')),
  Priority(
      priorityType: PriorityType(
          name: 'very high', priorityLevel: 3, amharicName: 'በጣም ከፍተኛ')),
  Priority(
      priorityType:
          PriorityType(name: 'urgent', priorityLevel: 4, amharicName: 'አስቸኳይ')),
];
