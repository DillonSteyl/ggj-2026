class_name Stage
extends Resource

@export var request_generator: RequestGenerator

@export_group("Success Criteria")
@export var num_successes: int = 3
@export var from_x_last_attempts: int = 3
