abstract class AppError {}

abstract class NetError extends AppError {}

class ConnectionError extends NetError {}

class ParseError extends NetError {}
