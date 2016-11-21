"""Use testinfra and py.test to verify formula works properly"""

def test_syncthing_is_installed(Package):
    syncthing = Package("syncthing")
    assert syncthing.is_installed

def test_syncthing_is_running_and_enabled(Service):
    syncthing = Service("syncthing")
    assert syncthing.is_running
    assert syncthing.is_enabled

def test_syncthing_is_configured(SystemInfo, File):
    os = SystemInfo.type
    if os in ['freebsd']:
        assert File('/etc/rc.conf').contains(
            'syncthing_user="syncthing"')
        assert File('/etc/rc.conf').contains(
            'syncthing_group="syncthing"')
        assert File('/etc/rc.conf').contains(
            'syncthing_dir="/var/db/syncthing"')
