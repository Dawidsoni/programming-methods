include String
include Unix
include Sys

(*ocamlc -c unix.cma scl.ml*)

(*Zad 2*)

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
	(Chann: CHANNEL) 
	(Serial: SERIAL with type t_serial = Chann.t_data) 
	(Proc: PROCESSOR with type t = Serial.t) =
	struct
		let rec run c_init = 
			let chann = Chann.init c_init in
			let s_data = Chann.receive chann in 
			let d_data = Serial.deserial s_data in 
			let p_data = Proc.process d_data in
			let result = Serial.serial p_data in
			let _ = Chann.send result chann	in 
			let _ = Chann.close chann in
				run c_init	
	end

module Client
	(Chann: CHANNEL) 
	(Serial: SERIAL with type t_serial = Chann.t_data) =
	struct
		let ask c_init data = 
			let chann = Chann.init c_init in
			let s_data = Serial.serial data in 
			let _ = Chann.send s_data chann in
			let s_result = Chann.receive chann in 
			let _ = Chann.close chann in 
				Serial.deserial s_result
	end	

(*Zad 4*)

module Channel : CHANNEL
	with type t = string * string 
	and type t_init = string * string 
	and type t_data = string =
struct 
	type t = string * string
	type t_init = string * string
	type t_data = string
	
	let init path_pair = path_pair
	
	let close path = ()

	let rec read_data chann = 
		try
			let line = input_line chann in
				line ^ read_data chann
		with exc ->
			close_in chann;
			""	
	
	let rec receive (path_in, path_out) = 
		try		
			let chann = open_in path_in in
			let data = read_data chann in
				
				Sys.remove path_in;
				data				
		with exc ->
			Unix.sleep 3;
			receive (path_in, path_out)	
		
	let rec send data (path_in, path_out) =  
		try 
			let chann = open_out path_out in
				output_string chann data;
				close_out chann
		with exc ->
			Unix.sleep 3;
			send data (path_in, path_out)		
end	

(*Zad 5*)

module Serial : SERIAL
	with type t = string list 
	and type t_serial = string = 
struct 
	type t = string list
	type t_serial = string
	
	let rec serial list = 
		match list with 
		 | [] -> ""
		 | (x::[]) -> x 
		 | (x::xs) -> x ^ "#" ^ serial xs	
		 
	let deserial text =
		let rec aux acc pos = 
			if pos < length text && get text pos != '#' then
				aux (acc + 1) (pos + 1)				
			else 
			let m_text = String.sub text (pos - acc) acc in
			if pos = length text then
				[m_text]
			else 
				m_text :: aux 0 (pos + 1)
		in
			aux 0 0
end
		 
(*Zad 6*)

module Processor : PROCESSOR 
	with type t = string list =
struct
	type t = string list

	let m_list = ref []
	
	let save_mapping title body = 
		m_list := (title, body) :: (!m_list)
		
	let get_mapping title = 
		let rec aux list = 
			match list with 
			 | [] -> failwith "Mapping exception"
			 | ((cand, result)::xs) -> 
				if cand = title then result
				else aux xs
		in 
			aux (!m_list)
	
	let process list = 
		match list with 
		 | ["ping"] -> ["pong"]
		 | ["zostaw wiadomosc"; title; body] -> 
			save_mapping title body; 
			[]	
		 | ["odczytaj wiadomosc"; title] -> 
			[get_mapping title]
		 | _ -> failwith "Process exception"
end

(*Zad 7*)


module StringServer = Server (Channel) (Serial) (Processor)
module StringClient = Client (Channel) (Serial)
	



