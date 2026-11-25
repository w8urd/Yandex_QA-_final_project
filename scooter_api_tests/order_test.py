# Трушин Даниил, 49-я когорта — Финальный проект. Инженер по тестированию плюс
import data
import sender_stand_request


def test_get_order_by_track_returns_200():
    # 1. Выполнить запрос на создание заказа
    create_response = sender_stand_request.post_new_order(data.order_body)

    # 2. Сохранить номер трека заказа
    track_number = create_response.json()["track"]

    # 3. Выполнить запрос на получение заказа по треку заказа
    get_response = sender_stand_request.get_order_by_track(track_number)

    # 4. Проверить, что код ответа равен 200
    assert get_response.status_code == 200