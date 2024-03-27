
namespace java dev.vality.scrooge.base
namespace erlang scrooge.base

/**
 * Отметка во времени согласно RFC 3339.
 *
 * Строка должна содержать дату и время в UTC в следующем формате:
 * `2016-03-22T06:12:27Z`.
 */
typedef string Timestamp

/** Идентификатор объекта */
typedef string ID

/** Сумма в минимальных денежных единицах. */
typedef i64 Amount

/** Баланс счета */
struct Balance {
    1: required Amount amount
    2: required string currency_code
}