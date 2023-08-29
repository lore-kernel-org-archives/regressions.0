Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C48B63BE
	for <regressions@lists.linux.dev>; Tue, 29 Aug 2023 08:17:21 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-55b0e7efb1cso2000875a12.1
        for <regressions@lists.linux.dev>; Tue, 29 Aug 2023 01:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693297040; x=1693901840;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hUPX1B9IT02IPgbp3gQKJ4s0jW2icwPDD7Z8YFg3AYg=;
        b=VEs10iU+dxmJreW+YWCicNzrps5btu9NpGHGBX4htUNXCvYc0J5DUzpYnnjseG8Pnk
         vxqdUoSrGhkulCCSl6tvbf7q0H6zIh6peVP7vaQxhd4hxb1hWE5Snf3NEh3FfXQ7V/xk
         5Y2J4RyA1udcB96l4MbYDLvakgjmfvFK0EQ6okz/MxY3m3KNoy9jnP4vwj2pHeFPAKKi
         V28dx0RdXSPEjZiSbzPwiqkyW4sJUro3iupyUczFmCyT1P+sie5GQY3XnRvR8zmo3cUo
         gBFxjYqDSAAQjOjFtHSTIaOnu00A43ydArgXpXBpbDQ+rm3VZVMspuCCvU8MoYvuIDId
         /o6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693297040; x=1693901840;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hUPX1B9IT02IPgbp3gQKJ4s0jW2icwPDD7Z8YFg3AYg=;
        b=AXdCHS6onTvyo14aYQPySW1lDvIZtpz4f3zdm//bwapgn/FQyB5mV/G1nWZdEw2N5i
         WtTKqbzXMZ+46QOfPkYuONtMfliGAmCXET//RW6TXz6cIFoJ9A88Jn7/1QDK0jWVQ+7B
         f3PeoPDfRiRT/0XlIdY5kfTwPtHOhF0Lun86VW8UAPWfCLQDnHMqf71ObwX6N9LNSYbx
         EBf6YlWkceugAKeg+I6RUlu7eJc3BpubB6EdqUIzNbTEwgCRFTJ+uM46mtHyuvckf04r
         yR0dXrVzdTNWh9OqtDwvhpOrAluSOwl5jSYTTzjDbddrpyXTTXtn2TQP0lVnk+w21s4w
         sWCA==
X-Gm-Message-State: AOJu0Yxyr78nZbT7+CydO+sD1uDS02YoG+nj+AQh8Wum/gInmr07qpxQ
	4a26SAfyI6ln6C76c55wO6w=
X-Google-Smtp-Source: AGHT+IHTTSkRDx+coFntMCNAwjhV6OY8O9YyvxAWQCJ9NDokBj2FIlMzEZIWh4DP67jzArmg0BSzLQ==
X-Received: by 2002:a17:90b:1996:b0:26d:262e:70be with SMTP id mv22-20020a17090b199600b0026d262e70bemr20221239pjb.22.1693297040531;
        Tue, 29 Aug 2023 01:17:20 -0700 (PDT)
Received: from debian.me ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id 22-20020a17090a1a1600b0026f7554821csm9029144pjk.27.2023.08.29.01.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Aug 2023 01:17:19 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 4806882EFB8F; Tue, 29 Aug 2023 15:17:16 +0700 (WIB)
Date: Tue, 29 Aug 2023 15:17:15 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Marc Haber <mh+linux-kernel@zugschlus.de>, linux-kernel@vger.kernel.org
Cc: Linux Regressions <regressions@lists.linux.dev>,
	Linux KVM <kvm@vger.kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>
Subject: Re: Linux 6.5 speed regression, boot VERY slow with anything systemd
 related
Message-ID: <ZO2piz5n1MiKR-3-@debian.me>
References: <ZO2RlYCDl8kmNHnN@torres.zugschlus.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="spOfNqo0AyqeAqCG"
Content-Disposition: inline
In-Reply-To: <ZO2RlYCDl8kmNHnN@torres.zugschlus.de>


--spOfNqo0AyqeAqCG
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[also Cc: regressions and KVM mailing lists]

On Tue, Aug 29, 2023 at 08:35:01AM +0200, Marc Haber wrote:
> Hi,
>=20
> I am always quickly upgrading my fleet to new stable kernels. So I
> updated my 9 test machines yesterday and found that one of those test
> machines gets abysmally slow after the kernel has finshed the early boot
> sequence and control is handed over to systemd.
>=20
> The boot eventually finishes, but it takes like 50 minutes instead of 30
> seconds to get the machine to attach to the network, start up sshd and
> to show a login prompt. The machine is a KVM/QEMU VM running on an APU
> host ("AMD GX-412TC SOC"). The host is still on 6.4.12, is NOT under
> memory or IO pressure, and on the host it looks like the VM is just
> taking about 10 % of a single core and happily chugging away.
>=20
> Others of my test machines are KVM VMs running on different, more
> powerful hosts, and those are booting 6.5 just fine, so I guess that the
> issue is somehow caused by the APU host. I have upgraded a second VM on
> the host in question to Linux 6.5 and that VM exhibits the same
> behavior.
>=20
> This is the tail of the boot messages of the VM on the serial console,
> and I am attaching the entirety of the messages under the signature:
> hub 1-0:1.0: USB hub found
> hub 1-0:1.0: 6 ports detected
> sr 0:0:0:0: [sr0] scsi3-mmc drive: 4x/4x cd/rw xa/form2 tray
> cdrom: Uniform CD-ROM driver Revision: 3.20
> virtio-pci 0000:00:07.0: virtio_pci: leaving for legacy driver
> usb 1-1: new high-speed USB device number 2 using ehci-pci
> virtio-pci 0000:00:08.0: virtio_pci: leaving for legacy driver
> usb 1-1: New USB device found, idVendor=3D0627, idProduct=3D0001, bcdDevi=
ce=3D 0.00
> usb 1-1: New USB device strings: Mfr=3D1, Product=3D3, SerialNumber=3D5
> usb 1-1: Product: QEMU USB Tablet
> usb 1-1: Manufacturer: QEMU
> virtio-pci 0000:00:09.0: virtio_pci: leaving for legacy driver
> usb 1-1: SerialNumber: 42
> input: QEMU QEMU USB Tablet as /devices/pci0000:00/0000:00:05.7/usb1/1-1/=
1-1:1.0/0003:0627:0001.0001/input/input4
> hid-generic 0003:0627:0001.0001: input,hidraw0: USB HID v0.01 Mouse [QEMU=
 QEMU USB Tablet] on usb-0000:00:05.7-1/input0
> usbcore: registered new interface driver usbhid
> usbhid: USB HID core driver
> virtio-pci 0000:00:0a.0: virtio_pci: leaving for legacy driver
> virtio_blk virtio2: 1/0/0 default/read/poll queues
> virtio_blk virtio2: [vda] 8388608 512-byte logical blocks (4.29 GB/4.00 G=
iB)
>  vda: vda1 vda2
> virtio_blk virtio4: 1/0/0 default/read/poll queues
> virtio_net virtio0 ens3: renamed from eth0
> virtio_blk virtio4: [vdb] 1048576 512-byte logical blocks (537 MB/512 MiB)
> Begin: Loading essential drivers ... done.
> Begin: Running /scripts/init-premount ... done.
> Begin: Mounting root file system ... Begin: Running /scripts/local-top ..=
=2E done.
> Begin: Running /scripts/local-premount ... done.
> Begin: Will now check root file system ... fsck from util-linux 2.38.1
> [/sbin/fsck.ext4 (1) -- /dev/vda2] fsck.ext4 -a -C0 /dev/vda2
> ronde-root: clean, 41578/262144 files, 405761/1048315 blocks
> done.
> EXT4-fs (vda2): mounted filesystem 3af5627c-4ed5-4f35-b0b3-60be041708cb r=
o with ordered data mode. Quota mode: none.
> done.
> Begin: Running /scripts/local-bottom ... done.
> Begin: Running /scripts/init-bottom ... done.
> systemd[1]: Inserted module 'autofs4'
> random: crng init done
> systemd[1]: systemd 252.12-1~deb12u1 running in system mode (+PAM +AUDIT =
+SELINUX +APPARMOR +IMA +SMACK +SECCOMP +GCRYPT -GNUTLS +OPENSSL +ACL +BLKI=
D +CURL +ELFUTILS +FIDO2 +IDN2 -IDN +IPTC +KMOD +LIBCRYPTSETUP +LIBFDISK +P=
CRE2 -PWQUALITY +P11KIT +QRENCODE +TPM2 +BZIP2 +LZ4 +XZ +ZLIB +ZSTD -BPF_FR=
AMEWORK -XKBCOMMON +UTMP +SYSVINIT default-hierarchy=3Dunified)
> systemd[1]: Detected virtualization kvm.
> systemd[1]: Detected architecture x86-64.
>=20
> Welcome to Debian GNU/Linux 12 (bookworm)!
>=20
> systemd[1]: Hostname set to <ronde>.
> systemd[1]: Queued start job for default target graphical.target.
> systemd[1]: Created slice system-getty.slice - Slice /system/getty.
>=20
> this is the point when things are slowing down horribly, the system is si=
tting for like 30 seconds for each line.
>=20
> [  OK  ] Created slice system-getty.slice - Slice /system/getty.systemd[1=
]: Created slice system-modprobe.slice - Slice /system/modprobe.
>=20
> [  OK  ] Created slice system-modpr=E2=80=A6lice - Slice /system/modprobe=
=2Esystemd[1]: Created slice system-radiator.slice - Slice /system/radiator.
>=20
> [  OK  ] Created slice system-radia=E2=80=A6lice - Slice /system/radiator=
=2Esystemd[1]: Created slice system-serial\x2dgetty.slice - Slice /system/s=
erial-getty.
>=20
> [  OK  ] Created slice system-seria=E2=80=A6 - Slice /system/serial-getty=
=2Esystemd[1]: Created slice user.slice - User and Session Slice.
>=20
> [  OK  ] Created slice user.slice - User and Session Slice.systemd[1]: St=
arted systemd-ask-password-console.path - Dispatch Password Requests to Con=
sole Directory Watch.
>=20
> [  OK  ] Started systemd-ask-passwo=E2=80=A6quests to Console Directory W=
atch.systemd[1]: Started systemd-ask-password-wall.path - Forward Password =
Requests to Wall Directory Watch.
>=20
> [  OK  ] Started systemd-ask-passwo=E2=80=A6 Requests to Wall Directory W=
atch.systemd[1]: Set up automount proc-sys-fs-binfmt_misc.automount - Arbit=
rary Executable File Formats File System Automount Point.
>=20
> [  OK  ] Set up automount proc-sys-=E2=80=A6rmats File System Automount P=
oint.systemd[1]: Reached target cryptsetup.target - Local Encrypted Volumes.
>=20
> This looks like systemd is waiting for something to time out, since the
> delay is about 30 seconds (as exactly as I can sit tight with a
> stopwatch). Going back to kernel 6.4.12 things are fixed immediately.
>=20
> The VMs in question are running debian bookworm with systemd 252.
>=20
> When the machine eventually allows a log in, systemctl --failed says
> "Failed to query system state: Message recipient disconnected from
> message bus without replying", but this fixes itself after another half
> an hour or so.
>=20
> What would you recommend doing to fix this?

Can you attach full journalctl log so that we can see which services
timed out?

In any case, bisecting kernel is highly appreciated in order to pin down
the culprit. See Documentation/admin-guide/bug-bisect.html for how to do th=
at.
Regardless, I'm adding this regression to be tracked by regzbot:

#regzbot ^introduced: v6.4..v6.5
#regzbot title: systemd services timeout causing almost an hour of boot time

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--spOfNqo0AyqeAqCG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZO2phgAKCRD2uYlJVVFO
o373AQD7CV+j/jIrktMHHKOm7BsvLaIM4YLYAJA0beYhwmqkCAEA+Utpm4rP/Kh/
Jxd1vkUoKzosLAY9bu29Obpf+zTEfwI=
=sQ+T
-----END PGP SIGNATURE-----

--spOfNqo0AyqeAqCG--
