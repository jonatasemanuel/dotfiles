randomize_session_names() {
    # Define session names, each on a new line for clarity
    session_names=(
	"Luffy"
	"Zoro"
	"Nami"
	"Usopp"
	"Sanji"
	"Chopper"
	"Nico Robin"
	"Franky"
	"Brook"
	"Jinbe"
	"Ace"
	"Roger"
	"Shanks"
	"Buggy"
	"Mihawk"
	"Trafalgar"
	"Hancock"
	"Sabo"
	"Smoker"
	"Koby"
	"Garp"
	"Teach"
	"Kaido"
	"Big Mom"
	"Enel"
	"Crocodile"
	"Kuma"
	"Doflamingo"
	"Gecko Moria"
	"Sengoku the Buddha"
	"Rayleigh"
	"Caesar Clown"
	"Katakuri"
	"Cracker"
	"Smoothie"
	"Eustass Kid"
	"Basil Hawkins"
	"X Drake"
	"Jewelry Bonney"
	"Scratchmen Apoo"
	"Killer"
	"Capone Bege"
	"Shiryu of the Rain"
	"Kozuki'Oden"
	"Kiku"
	"Kawamatsu"
	"Kin'emon"
	"Inuarashi"
	"Nekomamushi"
	"Benn Beckman"
	"Yasopp"
	"Jesus Burgess"
    )

    # Print the session names, pipe them to `shuf` to randomize, then print the randomized list
    printf "%s\n" "${session_names[@]}" | shuf
}

# Start tmux if not already running
if [ -n "$PS1" ] && [ -z "$TMUX" ]; then
    for name in $(randomize_session_names); do
        echo $name
        # Check if the session name is already in use
        if ! tmux has-session -t $name 2>/dev/null; then
            # Create a new session with the name
            tmux new-session -d -s $name
            # Attach to the session
            tmux attach-session -t $name
            # Break the loop
            break
        fi
    done
fi
