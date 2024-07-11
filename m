Received: from postout2.mail.lrz.de (postout2.mail.lrz.de [129.187.255.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989CE84DE2
	for <regressions@lists.linux.dev>; Thu, 11 Jul 2024 06:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.187.255.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720678824; cv=none; b=EYQAFRWwgkRuTNw2oAcOCeWXBfxAI5hrDwFK0tx6rb71Gk/07rXQCBhV2clRgHYO9e/m0zWyg2gNQwdxNCf2cMhEhiCgAFoFSb1rOB8daW0iXTKYNObvvhTxRWdcrPyZMSwejtGYOAvHEvjnJl/SgxxMd2uaUp128rKLPv9GdTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720678824; c=relaxed/simple;
	bh=B8pUYVfa+p0FXCJKDtrGpWHQb6RCBTFMxeP/0EvTYfY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XPXERtnXwfMOQe+NhYDrXSKbjOZRQAIrwIhmiGHGnmwS4A77S/IAOBJ8c/mDPzHn4ISim/XjU1B/ywKKO1hS4sHPSo3c3x5/fqS7ZfuDCBSHri9wMMq9MrfQiz8nCUVr7GjFQogHnyakOZDnsiD161mGbwdDn8Rnvrje5zTrAkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lrz.de; spf=pass smtp.mailfrom=lrz.de; dkim=pass (2048-bit key) header.d=lrz.de header.i=@lrz.de header.b=n7Le7rgG; arc=none smtp.client-ip=129.187.255.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lrz.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lrz.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lrz.de header.i=@lrz.de header.b="n7Le7rgG"
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4WKPj560JzzyXM;
	Thu, 11 Jul 2024 08:20:09 +0200 (CEST)
Authentication-Results: postout.lrz.de (amavisd-new); dkim=pass (2048-bit key)
	reason="pass (just generated, assumed good)" header.d=lrz.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lrz.de; h=
	mime-version:content-type:content-type:content-language
	:accept-language:in-reply-to:references:message-id:date:date
	:subject:subject:from:from:received:received:received:received;
	 s=postout; t=1720678809; bh=B8pUYVfa+p0FXCJKDtrGpWHQb6RCBTFMxeP
	/0EvTYfY=; b=n7Le7rgGu5ZE4cglOfzRaH6DtYmqvpeaM7wEb1r0DrWs0APOWIc
	RIGnC1kqGbs413BqZJXzmHxTZ5gix5M137pHueLZMYtffVZiX98pgVdKNRN8r+FW
	5wbEAshNsOQJvMQt0zR10T8+YWotcMFo09wkbavaPigib3XHuUqq34aaXYRpeIur
	wdczdZlXnGax98bu2sM0mgvDA/EZATTHaFnk112yCWkwUmBjEGwXC+fYHLyLpqaO
	BmWgyZvhpR83obIUMRX53+cRa3IBGK/cs4Lb15QDuUNttaOhWlW2k+nFZdFlOL5K
	ukm6lisrIVzDTtoXlADmUqdPqu67y0MApqQ==
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.862
X-Spam-Level:
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id EU-LiW3by8DO; Thu, 11 Jul 2024 08:20:09 +0200 (CEST)
Received: from BADWLRZ-SWEX01A.ads.mwn.de (BADWLRZ-SWEX01A.ads.mwn.de [IPv6:2001:4ca0:0:108::191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "BADWLRZ-SWEX01A", Issuer "BADWLRZ-SWEX01A" (not verified))
	by postout2.mail.lrz.de (Postfix) with ESMTPS id 4WKPj46DVWzyVP;
	Thu, 11 Jul 2024 08:20:08 +0200 (CEST)
Received: from BADWLRZ-SWEX03A.ads.mwn.de (2001:4ca0:0:108::195) by
 BADWLRZ-SWEX01A.ads.mwn.de (2001:4ca0:0:108::191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 11 Jul 2024 08:20:08 +0200
Received: from BADWLRZ-SWEX03A.ads.mwn.de ([fe80::135:d2e8:a257:4168]) by
 BADWLRZ-SWEX03A.ads.mwn.de ([fe80::135:d2e8:a257:4168%15]) with mapi id
 15.02.1544.011; Thu, 11 Jul 2024 08:20:08 +0200
From: =?utf-8?B?U3RlaW5iZWnDn2VyLCBTZWJhc3RpYW4=?=
	<Sebastian.Steinbeisser@lrz.de>
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"pc@manguebit.com" <pc@manguebit.com>
CC: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: Potential smb/dfs regression introduced in kernel 6.6
Thread-Topic: Potential smb/dfs regression introduced in kernel 6.6
Thread-Index: AQHayJXmtmc2qLL700qAmNg0Q6RQvrHbwjy5gADy1QCAFEz7gA==
Date: Thu, 11 Jul 2024 06:20:08 +0000
Message-ID: <5210f9e7b720dc1d150bd2ebd9f4edadf39685aa.camel@lrz.de>
References: <dd878fc236840921d3e31944e26694fed941d0c6.camel@lrz.de>
	 <f3a02647b6fcb27a70da4c334930ad3c@manguebit.com>
	 <9654b28ff276b5b78ffcc3078bd4dd1ccf80ec73.camel@lrz.de>
In-Reply-To: <9654b28ff276b5b78ffcc3078bd4dd1ccf80ec73.camel@lrz.de>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
Content-Type: multipart/signed; micalg=sha-384;
	protocol="application/pkcs7-signature"; boundary="=-2P6t4ZRGTdN55NQAQ9yJ"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

--=-2P6t4ZRGTdN55NQAQ9yJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-rJ8rLXDGDcMCsc82tcGL"


--=-rJ8rLXDGDcMCsc82tcGL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Greg,
Dear Paulo,

Have you been able to take a look at the logs I sent?
Is there any additional information I can provide?

Thanks!

Best
Sebastian
+-------------------------------------------------------------+
 Sebastian Steinbei=C3=9Fer
 Leibniz-Rechenzentrum   Tel.:+49-89-35831-8779
 Boltzmannstra=C3=9Fe 1       E-Mail: Sebastian.Steinbeisser@lrz.de
 D-85748 Garching
+-------------------------------------------------------------+


-----Original Message-----
From: Sebastian Steinbei=C3=9Fer <Sebastian.Steinbeisser@lrz.de>
To: Greg KH <gregkh@linuxfoundation.org>, Paulo Alcantara
<pc@manguebit.com>
Cc: regressions@lists.linux.dev <regressions@lists.linux.dev>
Subject: Re: Potential smb/dfs regression introduced in kernel 6.6
Date: 28.06.2024 10:19:24

Dear Greg,
Dear Paulo,

thanks for the quick reply and sorry for my late one - getting
information internally and from the customer who reported the issue
took some time.
Here we go:

1. We do currently not have the capacity to bisect, but the customer
reporting the issue speculated that it might have been introduced
between commits 9a49e221a64111535f65e9c8804db24d11eaff8b and
539aad7f14dab7f947e5ab81901c0b20513a50db

2. I can not for sure confirm or deny if the subvolume is realized as a
DFS link.

3. The logs as requested are attached.

4. About the setup used in the example:
Two fresh virtual machines running lubuntu 22.04 and 24.04 with kernels
6.5.0 and 6.8.0, respectively.
Both of them were installed today and updated.
After that the smb-client and cifs-utils packages were installed and
both VMs were rebooted.
The tracing was done in parallel.

4. About the infrastructure in the example:
The "badw" share contains several folders, three of which are realized
as their own volumes:

volume=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 junction-path
-------------- ---------------
mwn_share_badw /mwn_share_badw
mwn_share_badwifv
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 /mwn_share_badw/ifv
mwn_share_badwlrz
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 /mwn_share_badw/lrz
mwn_share_badwver
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 /mwn_share_badw/ver
These are the ones that can not be accessed -> see the ls_error_message
attachement.
We're exporting shares with CIFS 3.2 and the following security
settings:
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 Kerberos Clock Skew: 5 minutes
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 Kerberos Ticket Age: 10 hours
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 Kerberos Renewal Age: 7 days
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 Kerberos KDC Timeout: 3 seconds
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 Is Signing Required: true
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 Is Password Complexity Required: true
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Use start_tls =
for AD LDAP connection: true
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (DEPRECATED)-Is AES Encryp=
tion Enabled: true
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LM Co=
mpatibility Level: lm-ntlm-ntlmv2-krb
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Is SMB Encryption Required: t=
rue
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Client Sess=
ion Security: seal
=C2=A0=C2=A0 (DEPRECATED)-SMB1 Enabled for DC Connections: false
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 SMB2 Enabled for DC Connections: true
=C2=A0 LDAP Referral Enabled For AD LDAP connections: false
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 Use LDAPS for AD LDAP connection: false
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Encryption is required for DC Connections: t=
rue
=C2=A0=C2=A0 AES session key enabled for NetLogon channel: false
=C2=A0=C2=A0=C2=A0 Try Channel Binding For AD LDAP Connections: true
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Encryption Types Advertised to K=
erberos: aes-256, aes-128, rc4,
des


Thus traces are most likely encrypted.

Thanks a lot!

Best
Sebastian
+-------------------------------------------------------------+
=C2=A0Sebastian Steinbei=C3=9Fer
=C2=A0Leibniz-Rechenzentrum=C2=A0=C2=A0 Tel.:+49-89-35831-8779
=C2=A0Boltzmannstra=C3=9Fe 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 E-Mail: Se=
bastian.Steinbeisser@lrz.de
=C2=A0D-85748 Garching
+-------------------------------------------------------------+


-----Original Message-----
From: Paulo Alcantara <pc@manguebit.com>
To: "Steinbei=C3=9Fer, Sebastian" <Sebastian.Steinbeisser@lrz.de>
Subject: Re: Potential smb/dfs regression introduced in kernel 6.6
Date: 27.06.2024 17:50:07

Paulo Alcantara <pc@manguebit.com> writes:

> Steinbei=C3=9Fer, Sebastian=C2=A0=C2=A0<Sebastian.Steinbeisser@lrz.de> wr=
ites:
>=20
> > The way this works with NetApp is that a volume, e.g., myvol,
> > within
> > the storage virtual machine (SVM - vserver) is exported and can be
> > accessed by mounting //SVM_IP/myvol into, e.g., /mnt/myvol
> > Subvolumes can be added to the junction path, e.g., mysubvol can be
> > mounted under myvol and used to be transparently accessable via
> > /mnt/myvol/mysubvol just like any directory within myvol would be.
> > This now is no longer the case and the subvolume needs to be
> > mounted
> > separately.
> >=20
> > This has started when customers upgraded distributions that shipped
> > with kernel >=3D6.6.
> > https://wiki.samba.org/index.php/LinuxCIFSKernel#6.6_(module_version_2.=
45)_(47_changesets)
> >=20
> > We've been able to reproduce the behavior with Fedora/Ubuntu and
> > kernels 6.6 to 6.9.
>=20
> Are you talking about DFS shares?=C2=A0 The "mysubvol" would be an DFS
> link?

Can you please provide verbose logs and network traces of both working
and non-working kernels:

=C2=A0# umount all SMB shares in the system
=C2=A0dmesg --clear
=C2=A0modprobe dns_resolver
=C2=A0modprobe cifs
=C2=A0echo 'module cifs +p' > /sys/kernel/debug/dynamic_debug/control
=C2=A0echo 'file fs/cifs/* +p' > /sys/kernel/debug/dynamic_debug/control
=C2=A0echo 1 > /proc/fs/cifs/cifsFYI
=C2=A0echo 1 > /sys/module/dns_resolver/parameters/debug
=C2=A0echo 0 > /proc/sys/kernel/printk_ratelimit
=C2=A0echo 0 > /proc/fs/cifs/dfscache
=C2=A0tcpdump -s 0 -w trace.pcap port 445 & pid=3D$!
=C2=A0cat /proc/fs/cifs/DebugData > trace.log
=C2=A0cat /proc/fs/cifs/dfscache >> trace.log
=C2=A0dmesg >> trace.log
=C2=A0# mount.cifs ... /mnt -o ...
=C2=A0# attempt to subvol under mounted share (i.e. ls /mnt/mysubvol)
=C2=A0cat /proc/fs/cifs/DebugData >> trace.log
=C2=A0cat /proc/fs/cifs/dfscache >> trace.log
=C2=A0dmesg >> trace.log
=C2=A0sleep 3
=C2=A0kill $pid

Then send trace.log and trace.pcap files of both kernels.

Thanks.

--=-rJ8rLXDGDcMCsc82tcGL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEyYbfXNcMyuhbpCh3C0OiiRZtSGkFAmaPeZcACgkQC0OiiRZt
SGkQ4Af+L/pBQLkOp4W3LDBDUxwPlrJR4FwTWQhPKF0jxDAUZCNJ+2MLEQnpRSfO
63nf9SNZDSLPd7X3U+UqRrL6jyvl/k1ZNYh5k+GHRpiyGp+ejV7F3p1RrfKZ+1Zg
WtdeCoSq56HUj8PJKEA8YAPErDCFOnib1xdOZuX13rs3bP4Uvdw7MOUynizSH5nX
zmmxCg0vkZdijh8l3pZXlmtarzXmEiW+UjVD2xJJV9P31wkT8UFgTE80eZ3SQdhE
1fXF9QcSNaYMlGQgGDSM3hxAH4ftT2m6ZT31qv9g048Cc4Hj/zpkxI06ON8t8Eeq
nc8yaLfVipoqoJaKLHDtmJMdflaDXg==
=MrpA
-----END PGP SIGNATURE-----

--=-rJ8rLXDGDcMCsc82tcGL--

--=-2P6t4ZRGTdN55NQAQ9yJ
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgIFADCABgkqhkiG9w0BBwEAAKCCE9Yw
ggZyMIIEWqADAgECAhB4WSw8yggu2tjprafqDVB3MA0GCSqGSIb3DQEBDAUAMEYxCzAJBgNVBAYT
Ak5MMRkwFwYDVQQKExBHRUFOVCBWZXJlbmlnaW5nMRwwGgYDVQQDExNHRUFOVCBQZXJzb25hbCBD
QSA0MB4XDTIzMDQwNTAwMDAwMFoXDTI2MDQwNDIzNTk1OVowgdYxSTBHBgNVBAoTQExlaWJuaXot
UmVjaGVuemVudHJ1bSBkZXIgQmF5ZXJpc2NoZW4gQWthZGVtaWUgZC4gV2lzc2Vuc2NoYWZ0ZW4x
GzAZBgNVBAkMEkJvbHR6bWFubnN0cmHDn2UgMTEPMA0GA1UECBMGQmF5ZXJuMQswCQYDVQQGEwJE
RTEgMB4GA1UEAwwXU3RlaW5iZWnDn2VyLCBTZWJhc3RpYW4xLDAqBgkqhkiG9w0BCQEWHXNlYmFz
dGlhbi5zdGVpbmJlaXNzZXJAbHJ6LmRlMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA
1tOueshjEujWZwBYyHyoO+kmDqVsdk7ahy3ey10S/PULIgHs2LcorCvy06ayLeMMkQVJqCJ7l/XW
dSgKdjvkklBYay6U6bB3sSDkHUSMNDscJYctXgxQd9/6o7WCdxXhTekd/L+YDueL/sG6ozfynduZ
j4ivj64T38neSm0hOKhd1+vK3yNbQLebuQ6CZRpb7ZjGcmIh+ro252MAedmhyyrCljtOsr2LdWMX
GvXhwcEvf2XqRj2HXOdEpbKoKooENN8ah5WQTUtB94BtBCQMbGzg8nmcwR3B38Ice97Wjv1+Kf4t
ueH+TlVWOiLpY5JqwOl/GFpIAU6lp0HgSO83IQIDAQABo4IByTCCAcUwHwYDVR0jBBgwFoAUaQCh
xyFY+ODFGyCwCt2nUb8T2eQwHQYDVR0OBBYEFH+HEyIOkKU+emsScF+IW9dWTcMHMA4GA1UdDwEB
/wQEAwIFoDAMBgNVHRMBAf8EAjAAMB0GA1UdJQQWMBQGCCsGAQUFBwMEBggrBgEFBQcDAjA/BgNV
HSAEODA2MDQGCysGAQQBsjEBAgJPMCUwIwYIKwYBBQUHAgEWF2h0dHBzOi8vc2VjdGlnby5jb20v
Q1BTMEIGA1UdHwQ7MDkwN6A1oDOGMWh0dHA6Ly9HRUFOVC5jcmwuc2VjdGlnby5jb20vR0VBTlRQ
ZXJzb25hbENBNC5jcmwweAYIKwYBBQUHAQEEbDBqMD0GCCsGAQUFBzAChjFodHRwOi8vR0VBTlQu
Y3J0LnNlY3RpZ28uY29tL0dFQU5UUGVyc29uYWxDQTQuY3J0MCkGCCsGAQUFBzABhh1odHRwOi8v
R0VBTlQub2NzcC5zZWN0aWdvLmNvbTBHBgNVHREEQDA+gR1TZWJhc3RpYW4uU3RlaW5iZWlzc2Vy
QGxyei5kZYEdc2ViYXN0aWFuLnN0ZWluYmVpc3NlckBscnouZGUwDQYJKoZIhvcNAQEMBQADggIB
ABGFqf3GfUcKjIValp5G72ihJu6fz9GT/2WTgs6MUyDjHZdm425XgXd0xTqqBCnQKma8GPJd61AY
3a6fUGlsrW96ZwlUWNJ1q/6qy0JC6c/Z+K7QP/2sBc07rea59p0RI500ADdWJjLv2aL71d0nammo
eiRPe5Ax5ho6lufR+wFiIABZri87n6e1N2ukQt9Hyk/TdsdyU6WYBD/0fP/p/73lr5Pc6npXxOfm
lryNcW3fBt+rGksfyH3qnCbISbUFUvqlglJ1viOEmACP7x1550Txcf96MPD2SNxT9rVUXhAYODHw
KA2H+Hx5s9ILt/7oTf6HqM959zQIdu9ATU7RMlUFpxN0chYYTgp4HBU5Gtm4hvLshS/WA1YVLNHa
Z/nTCyoFwYRw1IDwvHmbj9kOyhkvDkTpUQHgw38HU2qFiIzXnUEgQfOZkjYjgiRMIDL2tOaPrvgj
FaFqc4hWQ0/E1GYSsDDQrXmmz790lA7HAulMNOCiWN38eMSHH0rSUIogHudq0kswlX9mFDYfsWSi
/QR6ZuNMxo32asPGk7twzRcRAeSYk5GrGl5sqt4LD8GsWXz8rmvwYjZN/l5Jd/Dt8OvqyDC/Chwy
SfPsY027BfZyvDAjHD2luySuUB2dLHP90w8vRsNvKbhIF5Dh4t73nUGB79kaGi2BrQVXdCxzhp/z
MIIGcjCCBFqgAwIBAgIQeFksPMoILtrY6a2n6g1QdzANBgkqhkiG9w0BAQwFADBGMQswCQYDVQQG
EwJOTDEZMBcGA1UEChMQR0VBTlQgVmVyZW5pZ2luZzEcMBoGA1UEAxMTR0VBTlQgUGVyc29uYWwg
Q0EgNDAeFw0yMzA0MDUwMDAwMDBaFw0yNjA0MDQyMzU5NTlaMIHWMUkwRwYDVQQKE0BMZWlibml6
LVJlY2hlbnplbnRydW0gZGVyIEJheWVyaXNjaGVuIEFrYWRlbWllIGQuIFdpc3NlbnNjaGFmdGVu
MRswGQYDVQQJDBJCb2x0em1hbm5zdHJhw59lIDExDzANBgNVBAgTBkJheWVybjELMAkGA1UEBhMC
REUxIDAeBgNVBAMMF1N0ZWluYmVpw59lciwgU2ViYXN0aWFuMSwwKgYJKoZIhvcNAQkBFh1zZWJh
c3RpYW4uc3RlaW5iZWlzc2VyQGxyei5kZTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEB
ANbTrnrIYxLo1mcAWMh8qDvpJg6lbHZO2oct3stdEvz1CyIB7Ni3KKwr8tOmsi3jDJEFSagie5f1
1nUoCnY75JJQWGsulOmwd7Eg5B1EjDQ7HCWHLV4MUHff+qO1gncV4U3pHfy/mA7ni/7BuqM38p3b
mY+Ir4+uE9/J3kptITioXdfryt8jW0C3m7kOgmUaW+2YxnJiIfq6NudjAHnZocsqwpY7TrK9i3Vj
Fxr14cHBL39l6kY9h1znRKWyqCqKBDTfGoeVkE1LQfeAbQQkDGxs4PJ5nMEdwd/CHHve1o79fin+
Lbnh/k5VVjoi6WOSasDpfxhaSAFOpadB4EjvNyECAwEAAaOCAckwggHFMB8GA1UdIwQYMBaAFGkA
occhWPjgxRsgsArdp1G/E9nkMB0GA1UdDgQWBBR/hxMiDpClPnprEnBfiFvXVk3DBzAOBgNVHQ8B
Af8EBAMCBaAwDAYDVR0TAQH/BAIwADAdBgNVHSUEFjAUBggrBgEFBQcDBAYIKwYBBQUHAwIwPwYD
VR0gBDgwNjA0BgsrBgEEAbIxAQICTzAlMCMGCCsGAQUFBwIBFhdodHRwczovL3NlY3RpZ28uY29t
L0NQUzBCBgNVHR8EOzA5MDegNaAzhjFodHRwOi8vR0VBTlQuY3JsLnNlY3RpZ28uY29tL0dFQU5U
UGVyc29uYWxDQTQuY3JsMHgGCCsGAQUFBwEBBGwwajA9BggrBgEFBQcwAoYxaHR0cDovL0dFQU5U
LmNydC5zZWN0aWdvLmNvbS9HRUFOVFBlcnNvbmFsQ0E0LmNydDApBggrBgEFBQcwAYYdaHR0cDov
L0dFQU5ULm9jc3Auc2VjdGlnby5jb20wRwYDVR0RBEAwPoEdU2ViYXN0aWFuLlN0ZWluYmVpc3Nl
ckBscnouZGWBHXNlYmFzdGlhbi5zdGVpbmJlaXNzZXJAbHJ6LmRlMA0GCSqGSIb3DQEBDAUAA4IC
AQARhan9xn1HCoyFWpaeRu9ooSbun8/Rk/9lk4LOjFMg4x2XZuNuV4F3dMU6qgQp0CpmvBjyXetQ
GN2un1BpbK1vemcJVFjSdav+qstCQunP2fiu0D/9rAXNO63mufadESOdNAA3ViYy79mi+9XdJ2pp
qHokT3uQMeYaOpbn0fsBYiAAWa4vO5+ntTdrpELfR8pP03bHclOlmAQ/9Hz/6f+95a+T3Op6V8Tn
5pa8jXFt3wbfqxpLH8h96pwmyEm1BVL6pYJSdb4jhJgAj+8deedE8XH/ejDw9kjcU/a1VF4QGDgx
8CgNh/h8ebPSC7f+6E3+h6jPefc0CHbvQE1O0TJVBacTdHIWGE4KeBwVORrZuIby7IUv1gNWFSzR
2mf50wsqBcGEcNSA8Lx5m4/ZDsoZLw5E6VEB4MN/B1NqhYiM151BIEHzmZI2I4IkTCAy9rTmj674
IxWhanOIVkNPxNRmErAw0K15ps+/dJQOxwLpTDTgoljd/HjEhx9K0lCKIB7natJLMJV/ZhQ2H7Fk
ov0EembjTMaN9mrDxpO7cM0XEQHkmJORqxpebKreCw/BrFl8/K5r8GI2Tf5eSXfw7fDr6sgwvwoc
Mknz7GNNuwX2crwwIxw9pbskrlAdnSxz/dMPL0bDbym4SBeQ4eLe951Bge/ZGhotga0FV3Qsc4af
8zCCBuYwggTOoAMCAQICEDECcNQ1vpskmvhW0OHihUkwDQYJKoZIhvcNAQEMBQAwgYgxCzAJBgNV
BAYTAlVTMRMwEQYDVQQIEwpOZXcgSmVyc2V5MRQwEgYDVQQHEwtKZXJzZXkgQ2l0eTEeMBwGA1UE
ChMVVGhlIFVTRVJUUlVTVCBOZXR3b3JrMS4wLAYDVQQDEyVVU0VSVHJ1c3QgUlNBIENlcnRpZmlj
YXRpb24gQXV0aG9yaXR5MB4XDTIwMDIxODAwMDAwMFoXDTMzMDUwMTIzNTk1OVowRjELMAkGA1UE
BhMCTkwxGTAXBgNVBAoTEEdFQU5UIFZlcmVuaWdpbmcxHDAaBgNVBAMTE0dFQU5UIFBlcnNvbmFs
IENBIDQwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQCzSuIiXidb6QRbFAQ1MiAUrrTS
MUDGzVDAHqFEyq+eSmF/LZDeYpszai2kQsqWATz/cBA9gGjunvJ45G48ycC4D6gwZFvbBt5Jotxl
unBeB8K+crGar3v+RCQ4VfvToX07v+HTJ6EeEONR3IzJPTMyzgAwENGsAWf9va9HePQFJiChCzXq
hKpp0zen53S+8f9itEy06GS8aku7Mvyb4tMBBa9An3Y3ALIqIeymg/iYs8m9WkSkMyekNtFRB1+1
KlnNUpM05G8+sY9EucnQQRUIdHzYsvqjP3XlaSuB4Jj0ia66UGfi5Wx31mm5sKAz8Re9UGVWIqq6
wKFKxkSfuO4iwYiIPJoiGEux3dqabwFLduAroDF1IxE40PqGIdPXzYuZ/wL6BEfFAb0xy8bfm5S9
G7y/ts9mIlFpPtkLZ/nQ/iVOWdsu9ale/nK/uGF47xsxeW2LIvB4sH5U2+D4ad8vpNbcCrXIXXKt
kBnNHgxumNNZ0R1Isq/Pz7TALCxxDzWdsM7AO32/Jn7R4ldtGRZmKpJyfACDn8HU1QPhOtiWsjif
rMWnanJhQ6K7M/5qz8BmfPrca+MUrr1Y4NHZb9MrgPtWKQQyGDXy+G5F/iHGdZk7LS+F8NH+Ddol
t2wZpz52JqGMTDPIH5Qok4LLO95wbxtn+79Tw+wQxmDTuIg+LwIDAQABo4IBizCCAYcwHwYDVR0j
BBgwFoAUU3m/WqorSs9UgOHYm8Cd8rIDZsswHQYDVR0OBBYEFGkAocchWPjgxRsgsArdp1G/E9nk
MA4GA1UdDwEB/wQEAwIBhjASBgNVHRMBAf8ECDAGAQH/AgEAMB0GA1UdJQQWMBQGCCsGAQUFBwMC
BggrBgEFBQcDBDA4BgNVHSAEMTAvMC0GBFUdIAAwJTAjBggrBgEFBQcCARYXaHR0cHM6Ly9zZWN0
aWdvLmNvbS9DUFMwUAYDVR0fBEkwRzBFoEOgQYY/aHR0cDovL2NybC51c2VydHJ1c3QuY29tL1VT
RVJUcnVzdFJTQUNlcnRpZmljYXRpb25BdXRob3JpdHkuY3JsMHYGCCsGAQUFBwEBBGowaDA/Bggr
BgEFBQcwAoYzaHR0cDovL2NydC51c2VydHJ1c3QuY29tL1VTRVJUcnVzdFJTQUFkZFRydXN0Q0Eu
Y3J0MCUGCCsGAQUFBzABhhlodHRwOi8vb2NzcC51c2VydHJ1c3QuY29tMA0GCSqGSIb3DQEBDAUA
A4ICAQAKBU57DY8fEzkA/W/sYsbD7e0XquMBzHjcP0eXXXRD4EAEAGCWSs+QRL9XIxmx+52zx9wM
a8YTejlR+NKejiyKPTF0q63zMxrO/z/hUwo8IDcRRLS0NSgvTW6AN2rCXJe5iLN5fIfYgIBB9cy1
L6trPuZ/vjUJm87nQ7ExQzGqWN5F9U8MlAk0c5iLanG7GCMoNjHiF1n0baj6guUeG7n5qcwOQTyD
S19+NEqfwjUPUGasN1ZH8h1sE6PrzvRpti+rKzWpiU+i2/k3l2b5fFDy+Wu9jv6R9BoBh47es/UM
zwEZ2kSrIVVr4jSukk+FpmR5ZbtwiYNAV6sdb1srMGsILzXlrdasSE2nGHvZklk2zUdgn7b01MHq
67g0mNozGmT6Dam41Kbhv25WMFs871XqwVIb4gGoT1yRf/VePMm1jwauqijhKJFvrNweGnebGPei
paLxIo2iEA4qdRztEg/qyzWGogXK/TFdmivg322fMPQWjQkMhRGMM8SCjlZN22L8x0ZOYoVA2rHJ
m5P25IjZe+HPyn7ikJiSJmqlqFmUeowXF3D1dFlCCs/5yC06RYRqI2REFu+28t2nswIvY6xCFAR0
RtS8Mz2yXNld0js2MmiRUGrc7imWzdUPbPcv9sdUF7SsERGPIzYL8dIiHzit+YCoGCSXMg6peF37
hHNp1TGCAtowggLWAgEBMFowRjELMAkGA1UEBhMCTkwxGTAXBgNVBAoTEEdFQU5UIFZlcmVuaWdp
bmcxHDAaBgNVBAMTE0dFQU5UIFBlcnNvbmFsIENBIDQCEHhZLDzKCC7a2Omtp+oNUHcwDQYJYIZI
AWUDBAICBQCgggFRMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI0
MDcxMTA2MjAwOFowPwYJKoZIhvcNAQkEMTIEMCupI15phvZDW0oA6pU8/2WERDPUftJxeb+7wBth
VJUfbkJ9xl2zGbtCjfHIz43HmjBpBgkrBgEEAYI3EAQxXDBaMEYxCzAJBgNVBAYTAk5MMRkwFwYD
VQQKExBHRUFOVCBWZXJlbmlnaW5nMRwwGgYDVQQDExNHRUFOVCBQZXJzb25hbCBDQSA0AhB4WSw8
yggu2tjprafqDVB3MGsGCyqGSIb3DQEJEAILMVygWjBGMQswCQYDVQQGEwJOTDEZMBcGA1UEChMQ
R0VBTlQgVmVyZW5pZ2luZzEcMBoGA1UEAxMTR0VBTlQgUGVyc29uYWwgQ0EgNAIQeFksPMoILtrY
6a2n6g1QdzANBgkqhkiG9w0BAQEFAASCAQAEurngWaP0JkNzKNLuW5GWGM1xFWCvmY/vlRod2Glr
6zN1vJY/oCy5Dn+Vsj+vWFx6NTjYMXUqWEmpyOCg25HmExNpuHr9oHAFV6xvoaWdWOS4knB/DvKX
mYDOIcl7yN0DuUgvi4dIqzoIoNLWwZHN4/uyc7ANtpyctcOCyrGnV7kzC1ihOPzDATqrI+zlQowe
bfpLt2rA0xGK+CYBLgMSp27E86xyYYm6Tt2YkNej1URDx6kQM0DI2D14jbtlc84Q6Vu9FjQcS1G4
ak4oSX7aPP/9rWIHilDdzCFUvBy80aILyJFqGqH96RlcM6NBub/XH1LflM5Z/6obYId9Jq56AAAA
AAAA


--=-2P6t4ZRGTdN55NQAQ9yJ--
