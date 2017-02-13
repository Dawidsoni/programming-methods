(*ocamlc -c scl.mli*)

module type CHANNEL =
sig
	type t
	type t_init
	type t_data
	val init: t_init -> t
	val close: t -> unit
	val receive: t -> t_data
	val send: t_data -> t -> unit
end

module type SERIAL = 
sig 
	type t
	type t_serial
	val deserial: t_serial -> t
	val serial: t -> t_serial
end

module type PROCESSOR =
sig
	type t
	val process: t -> t
end

module Server 
	(C : CHANNEL) 
	(S : SERIAL with type t_serial = C.t_data) 
	(P: PROCESSOR with type t = S.t) :
	sig
		val run: C.t_init -> unit
	end
	
module Client 
	(C: CHANNEL) 
	(S: SERIAL with type t_serial = C.t_data) :
	sig
		val ask: C.t_init -> S.t -> S.t
	end
