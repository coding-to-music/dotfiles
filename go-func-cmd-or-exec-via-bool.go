//
// https://stackoverflow.com/questions/6182369/exec-a-shell-command-in-go/7786922#7786922
// 封装exec ，有shell= true 这样的选项

func Cmd(cmd string, shell bool) []byte {

	if shell {
		out, err := exec.Command("bash", "-c", cmd).Output()
		if err != nil {
			panic("some error found")
		}
		return out
	} else {
		out, err := exec.Command(cmd).Output()
		if err != nil {
			panic("some error found")
		}
		return out

	}
}