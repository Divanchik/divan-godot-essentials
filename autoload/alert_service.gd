extends Node

enum Level {
	INFO,
	WARNING,
	ERROR
}

signal log_info(message: String)
signal log_warning(message: String)
signal log_error(message: String)
