function license
  set -l base_url https://api.github.com/licenses
  set -l headers 'Accept: application/vnd.github.drax-preview+json'

  if test $argv[1]
    set -l license $argv[1]
    set -l res (curl --silent --header $headers $base_url/$license | jq -r '.body' | string collect)
    echo $res
  else
    set -l res (curl --silent --header $headers $base_url | jq -r '.[].key' | string collect)
    echo "Available Licenses: "
    echo
    echo $res
  end
end
