import React, { useState } from 'react';
import { TaskType } from '../types';

interface TaskInputProps {
  onAddTask: (title: string, type: TaskType) => void;
}

const TaskInput: React.FC<TaskInputProps> = ({ onAddTask }) => {
  const [title, setTitle] = useState('');
  const [type, setType] = useState<TaskType>(TaskType.Todo);

  const handleAdd = () => {
    if (title.trim()) {
      onAddTask(title.trim(), type);
      setTitle('');
    }
  };

  const handleKeyPress = (e: React.KeyboardEvent<HTMLInputElement>) => {
    if (e.key === 'Enter') {
      handleAdd();
    }
  };

  return (
    <div className="bg-slate-800/50 p-4 rounded-xl mb-6 shadow-lg border border-slate-700">
      <div className="flex flex-col sm:flex-row gap-3">
        <input
          type="text"
          value={title}
          onChange={(e) => setTitle(e.target.value)}
          onKeyPress={handleKeyPress}
          placeholder="Enter a new task..."
          className="flex-grow bg-slate-800 border border-slate-600 rounded-md px-4 py-2 focus:outline-none focus:ring-2 focus:ring-sky-500 transition-shadow text-slate-100"
        />
        <select
          value={type}
          onChange={(e) => setType(e.target.value as TaskType)}
          className="bg-slate-800 border border-slate-600 rounded-md px-4 py-2 focus:outline-none focus:ring-2 focus:ring-sky-500 cursor-pointer"
        >
          <option value={TaskType.Todo}>Todo</option>
          <option value={TaskType.Habit}>Habit</option>
        </select>
        <button
          onClick={handleAdd}
          className="px-4 py-2 font-semibold bg-sky-600 hover:bg-sky-500 rounded-md transition-colors text-white"
        >
          Add Task
        </button>
      </div>
    </div>
  );
};

export default TaskInput;