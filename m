Received: from smtp-outgoing-1703.laposte.net (smtp-outgoing-1703.laposte.net [160.92.124.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2599C16DECB
	for <regressions@lists.linux.dev>; Fri, 11 Apr 2025 13:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.92.124.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744377912; cv=none; b=iO8yZESgNYqv3j37q+2H0MBwSZl3LCrMf2FxuJ17NSBtKs0T/SZ7sACa6bDEWF/2YKbq4ftU+Q8m48f2jyv/Xl6BvWD5bbmphcvSLkGcUY9JSf5oLXRTBKsQgH9Q0ZqNSf4jZ0+NG7msAlVuIWaAfBjFi822MgF6+DVuv5KfukU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744377912; c=relaxed/simple;
	bh=wG01QiF2ojhksDG+5k9gZlEaIwN1hZWXbIfTbVEB1hk=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=uU6GcEra0jiU0jTQc+XxuVgl3e7UFnRWYp/0b1AL8CeanfjvmL3rYqFDDofXfVutZ2JXH+y9chCXO9R8IsqivaGRlM1LqOox11ZlaHYN5RE/4br1c/G/wqdrYaezwwmstgMoHPcpHMuSpDbgK5ms+dEAnbntJrnhpoxmHy1e6Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=laposte.net; spf=pass smtp.mailfrom=laposte.net; dkim=pass (2048-bit key) header.d=laposte.net header.i=@laposte.net header.b=RHHPEh+D; arc=none smtp.client-ip=160.92.124.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=laposte.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=laposte.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=laposte.net header.i=@laposte.net header.b="RHHPEh+D"
X-mail-filterd: {"version":"1.9.1","queueID":"4ZYrq96m22zjWvv","contextId":
 "375f7af2-4447-43d2-a6bd-49a0be243ea8"}
Received: from outgoing-mail.laposte.net (localhost.localdomain [127.0.0.1])
	by mlpnf0116.laposte.net (SMTP Server) with ESMTP id 4ZYrq96m22zjWvv;
	Fri, 11 Apr 2025 11:24:21 +0200 (CEST)
X-mail-filterd: {"version":"1.9.1","queueID":"4ZYrq92VblzjWvt","contextId":
 "05ff3ae9-243e-43d6-a727-b8e026122837"}
X-lpn-mailing: LEGIT
X-lpn-spamrating: 40
X-lpn-spamlevel: not-spam
Received: from [192.168.1.8] (91-169-167-190.subs.proxad.net [91.169.167.190])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mlpnf0116.laposte.net (SMTP Server) with ESMTPSA id 4ZYrq92VblzjWvt;
	Fri, 11 Apr 2025 11:24:21 +0200 (CEST)
Message-ID: <f23b88ef59b3967429c3993bf5715577f8c30407.camel@laposte.net>
Subject: [REGRESSION][BISECTED] mt7925e fails to reconnect after suspend on
 6.14.x
From: Patrick Nicolas <patricknicolas@laposte.net>
To: allan.wang@mediatek.com
Cc: regressions@lists.linux.dev, hao.zhang@mediatek.com,
 Leon.Yen@mediatek.com, 	nbd@nbd.name
Date: Fri, 11 Apr 2025 11:24:20 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=laposte.net; s=lpn-wlmd; t=1744377906; bh=wG01QiF2ojhksDG+5k9gZlEaIwN1hZWXbIfTbVEB1hk=; h=Message-ID:Subject:From:To:Cc:Date:Content-Type:Content-Transfer-Encoding:MIME-Version; b=RHHPEh+DXoWrVw+Rakpik2pA84D9tzGtZFUpJFslb1RMXhTpUTVmad2UqZyrETWid5njtA4teKwe16zn+TPmmEjxqpmn9WhPzts7Q58pdE/oMLRTRujQ8uys7mApqwf0DYBi2qTnFMfFqkb9KRpKUsA6UIAky3mVQW5uj9HIMuBnxvJjHYQ5w5FxghX5nU4896BQ2vr0Q+1xFuR8D01U1VVP9MXZ1bEFwKPZvjIPoh4bLC5sLvkyD4WIiQQepgprsvP+zaIbSQxnF4c+PkgLoMf/GNv8qtdv93C8Bcz5dmLkROV1E/N031EWEfg8OW4nEZ8Zsv04DU7C2Ck/EFb4jA==;

Starting with 6d18b668301e0a7d924a6c821b84516bc08bdafe
wifi: mt76: introduce mt792x_config_mac_addr_list routine

When resuming from suspend, WiFi fails to connect to my 5GHz network using
NetworkManager/iwd

journalctl logs after suspend:
avril 11 10:51:20 Rutherford systemd-logind[667]: Operation 'suspend' finis=
hed.
avril 11 10:51:20 Rutherford systemd[1]: Stopped target Suspend.
avril 11 10:51:20 Rutherford systemd-resolved[411]: Closing all remaining T=
CP
connections.
avril 11 10:51:20 Rutherford systemd-resolved[411]: Resetting learnt featur=
e
levels on all servers.
avril 11 10:51:20 Rutherford NetworkManager[684]: <info>  [1744361480.1292]
manager: sleep: wake requested (sleeping: yes  enabled: yes)
avril 11 10:51:20 Rutherford NetworkManager[684]: <info>  [1744361480.1293]
device (/net/connman/iwd/0): state change: unmanaged -> unavailable (reason
'managed', sys-iface-state: 'external')
avril 11 10:51:20 Rutherford NetworkManager[684]: <info>  [1744361480.1294]
device (wlan0): state change: unmanaged -> unavailable (reason 'managed', s=
ys-
iface-state: 'external')
avril 11 10:51:20 Rutherford dino[1695]: stream_connect.vala:76: Could not
establish XMPP session with meumeu.org:5222: Failed connecting to
meumeu.org:5222 (starttls): Erreur de r=C3=A9solution de =C2=AB=C2=A0meumeu=
.org=C2=A0=C2=BB=C2=A0: Nom ou
service inconnu
avril 11 10:51:20 Rutherford gnome-shell[1531]: Failed to make thread 'KMS
thread' high priority scheduled:
GDBus.Error:org.freedesktop.DBus.Error.NameHasNoOwner: Name
"org.freedesktop.RealtimeKit1" does not exist
avril 11 10:51:20 Rutherford gnome-shell[1531]: Failed to make thread 'KMS
thread' high priority scheduled:
GDBus.Error:org.freedesktop.DBus.Error.NameHasNoOwner: Name
"org.freedesktop.RealtimeKit1" does not exist
avril 11 10:51:20 Rutherford gnome-shell[1531]: Failed to make thread 'KMS
thread' high priority scheduled:
GDBus.Error:org.freedesktop.DBus.Error.NameHasNoOwner: Name
"org.freedesktop.RealtimeKit1" does not exist
avril 11 10:51:20 Rutherford kernel: mt7925e 0000:c2:00.0: HW/SW Version:
0x8a108a10, Build Time: 20250305132908a
avril 11 10:51:20 Rutherford gnome-shell[1531]: Failed to make thread 'KMS
thread' high priority scheduled:
GDBus.Error:org.freedesktop.DBus.Error.NameHasNoOwner: Name
"org.freedesktop.RealtimeKit1" does not exist
avril 11 10:51:20 Rutherford kernel: mt7925e 0000:c2:00.0: WM Firmware Vers=
ion:
____000000, Build Time: 20250305133013
avril 11 10:51:21 Rutherford iwd[727]: event: state, old: disconnected, new=
:
autoconnect_quick
avril 11 10:51:21 Rutherford NetworkManager[684]: <info>  [1744361481.3051]
manager: NetworkManager state is now DISCONNECTED
avril 11 10:51:21 Rutherford NetworkManager[684]: <info>  [1744361481.3053]
device (/net/connman/iwd/0): state change: unavailable -> disconnected (rea=
son
'none', sys-iface-state: 'managed')
avril 11 10:51:21 Rutherford kernel: mt7925e 0000:c2:00.0: HW/SW Version:
0x8a108a10, Build Time: 20250305132908a
avril 11 10:51:21 Rutherford kernel: mt7925e 0000:c2:00.0: WM Firmware Vers=
ion:
____000000, Build Time: 20250305133013
avril 11 10:51:22 Rutherford gdm-password][2951]: gkr-pam: keyring is unloc=
ked
avril 11 10:51:22 Rutherford kernel: wlan0: Driver requested disconnection =
from
AP 00:00:00:00:00:00
avril 11 10:51:22 Rutherford NetworkManager[684]: <info>  [1744361482.4495]
device (wlan0): new IWD device state is disconnected
avril 11 10:51:22 Rutherford NetworkManager[684]: <info>  [1744361482.4497]
device (wlan0): state change: unavailable -> disconnected (reason 'supplica=
nt-
available', sys-iface-state: 'managed')
avril 11 10:51:22 Rutherford iwd[727]: event: connect-info, ssid: Principia
5GHz, bss: 22:66:cf:d5:e9:60, signal: -33, load: 2/255
avril 11 10:51:22 Rutherford iwd[727]: event: state, old: autoconnect_quick=
,
new: connecting (auto)
avril 11 10:51:22 Rutherford NetworkManager[684]: <info>  [1744361482.7131]
device (wlan0): new IWD device state is connecting
avril 11 10:51:22 Rutherford NetworkManager[684]: <info>  [1744361482.7136]
device (wlan0): Activation: starting connection 'Principia 5GHz' (d6f62917-=
8664-
46f3-8666-41a824846afc)
avril 11 10:51:22 Rutherford NetworkManager[684]: <info>  [1744361482.7137]
device (wlan0): state change: disconnected -> prepare (reason 'none', sys-i=
face-
state: 'managed')
avril 11 10:51:22 Rutherford NetworkManager[684]: <info>  [1744361482.7138]
manager: NetworkManager state is now CONNECTING
avril 11 10:51:22 Rutherford NetworkManager[684]: <info>  [1744361482.7139]
device (wlan0): state change: prepare -> config (reason 'none', sys-iface-s=
tate:
'managed')
avril 11 10:51:22 Rutherford kernel: wlan0: authenticate with 22:66:cf:d5:e=
9:60
(local address=3Da8:e2:91:52:53:3e)
avril 11 10:51:23 Rutherford kernel: wlan0: send auth to 22:66:cf:d5:e9:60 =
(try
1/3)
avril 11 10:51:23 Rutherford kernel: wlan0: send auth to 22:66:cf:d5:e9:60 =
(try
2/3)
avril 11 10:51:23 Rutherford kernel: wlan0: send auth to 22:66:cf:d5:e9:60 =
(try
3/3)
avril 11 10:51:23 Rutherford kernel: wlan0: authentication with
22:66:cf:d5:e9:60 timed out


lspci -v -d 14c3:7925
c2:00.0 Network controller: MEDIATEK Corp. Device 7925
	Subsystem: AzureWave Device 6370
	Flags: bus master, fast devsel, latency 0, IRQ 151, IOMMU group 17
	Memory at dc800000 (64-bit, non-prefetchable) [size=3D2M]
	Memory at dca00000 (64-bit, non-prefetchable) [size=3D32K]
	Capabilities: [80] Express Endpoint, IntMsgNum 0
	Capabilities: [e0] MSI: Enable+ Count=3D1/32 Maskable+ 64bit+
	Capabilities: [f8] Power Management version 3
	Capabilities: [100] Vendor Specific Information: ID=3D1556 Rev=3D1 Len=3D0=
08
<?>
	Capabilities: [108] Latency Tolerance Reporting
	Capabilities: [110] L1 PM Substates
	Capabilities: [200] Advanced Error Reporting
	Kernel driver in use: mt7925e
	Kernel modules: mt7925e


Reverting the commit on top of 6.14.2 fixes the issue.

