if ds_queue_size(phrases) > 0 {
    phrase = ds_queue_dequeue(phrases);
    pos = -1;
    alarm[1] = delay;
}

