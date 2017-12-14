// Needed for Android. Don't use namespace * because it has problems in swift
namespace java net.gotev.todolist.server

struct ToDoItem {
    1: required string id;
    2: required string content;
    3: required bool done;
}

exception ToDoServerError {
    1: required i32 code;
    2: required string localizedKey;
    3: optional string message;
}

service ToDoList {

    list<ToDoItem> getToDo(1: required string accessToken) throws (1: ToDoServerError error);

    ToDoItem addItem(1: required string accessToken,
                     2: required string content) throws (1: ToDoServerError error);

    bool setItemDone(1: required string username,
                     2: required string itemID) throws (1: ToDoServerError error);

    bool deleteItem(1: required string username,
                    2: required string itemID) throws (1: ToDoServerError error);

}
