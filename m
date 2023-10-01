Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C390EDC
	for <regressions@lists.linux.dev>; Sun,  1 Oct 2023 05:12:09 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-578b4997decso12480824a12.0
        for <regressions@lists.linux.dev>; Sat, 30 Sep 2023 22:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696137129; x=1696741929; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S4YUhySqj0LKSfhzqzSpnPiis7zCCeIWybzjnn9kJe4=;
        b=FXMKrpg++c4YtVnpF+WkMi1fyUc9WBfAjKUwlWSkPmyxwuNqoNTgRqix0jfkedIYxn
         5DyJN5UKC3C0N9GCuNHwPbs+XMtWTsm4J2hlEP3aO5m00aR+FcBpO0XVGznSKhhAlj1P
         u/5qRKCgfITRdwlydFgVYSUPBvVbuyu6Tgl9ehDuEYJgxO/skzOugJbcWtHGIIzadBjB
         YLRD8VG+08kCHTHsEteYDX4te/2MF6jTyOeofP5tgKzgPKnN81mhY/hdqltbWJc8Tqp+
         nfYqnKxYVZr5IEDUbX68zRy2gRrJJH/2VgMT9IWc8MbzKdcXpZ/VQHpmX6DWMy6Qz4a6
         Jk9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696137129; x=1696741929;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S4YUhySqj0LKSfhzqzSpnPiis7zCCeIWybzjnn9kJe4=;
        b=mY3iXzDyeaOTQ7nBFXGbKstAHW3p1CutzPwXFI6UYBKRbwM+HD3Q3u0JZL9xfUzDwN
         lrNFRWm+76gZjHtp7j+2uNNEOcvkkiJfg0NXzrZEe36QEpyYLxYnH0Tcv1e/FFk+Hyi1
         7V+gtUgaeuRkCHMmM/JsJ0a7M/HxZheK1exWofuEUTCKGo+9KWGTwO8P0YGfTWLyRwTT
         tH8kCTmblXN6AL8uDldC/3m3O5rKNU1oG71gYvqDhcT6SZXo+GhK6txFo96Yj43VlOBl
         oRmpfnHPZO7m+Gpu0zCNJjVQ3g9YqVXPIhzv0+XOYIiNx5JatZ2Jppy6ayG2dS3Jxwja
         xlzQ==
X-Gm-Message-State: AOJu0YzSnvo4T9Xzpfuf58RupaDNTthp0HwIkIgyt6ZkdCExIakdQn7Y
	siyrxFhYRpkvZkxj7Tp8O0Y=
X-Google-Smtp-Source: AGHT+IFlfnmexc/xDdHnkmAXRnLPuNY/c26M5gwiQFZ+djIdGhfa1kG5j7ot4XT/hNIDq6Y/+WIvSA==
X-Received: by 2002:a05:6a20:4406:b0:153:dff0:c998 with SMTP id ce6-20020a056a20440600b00153dff0c998mr11017262pzb.6.1696137128430;
        Sat, 30 Sep 2023 22:12:08 -0700 (PDT)
Received: from debian.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id s22-20020a62e716000000b0069023d80e63sm17251232pfh.25.2023.09.30.22.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Sep 2023 22:12:07 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id A0B608C4A20F; Sun,  1 Oct 2023 12:12:03 +0700 (WIB)
Date: Sun, 1 Oct 2023 12:12:02 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: enc0der <enc0der@gmail.com>,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Wireless <linux-wireless@vger.kernel.org>,
	Linux Networking <netdev@vger.kernel.org>,
	Linux USB <linux-usb@vger.kernel.org>,
	Linux RCU <rcu@vger.kernel.org>
Cc: Stanislaw Gruszka <stf_xl@wp.pl>,
	Helmut Schaa <helmut.schaa@googlemail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Hayes Wang <hayeswang@realtek.com>, Simon Horman <horms@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Andrew Gaul <gaul@gaul.org>,
	=?utf-8?B?QmrDuHJu?= Mork <bjorn@mork.no>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <quic_neeraju@quicinc.com>,
	Joel Fernandes <joel@joelfernandes.org>,
	Josh Triplett <josh@joshtriplett.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang1211@gmail.com>
Subject: Re: rt8000usb driver issue (maybe interaction with other drivers)
Message-ID: <ZRj_ovMi-Xbb8i-D@debian.me>
References: <CAEXpi5Rd6Y4umKOWRsCjX0kit=W5ZrVhn=MuRkyvJPwmjjDVnA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zlCIcyjmXaMZlAlu"
Content-Disposition: inline
In-Reply-To: <CAEXpi5Rd6Y4umKOWRsCjX0kit=W5ZrVhn=MuRkyvJPwmjjDVnA@mail.gmail.com>


--zlCIcyjmXaMZlAlu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 30, 2023 at 06:04:22PM -0400, enc0der wrote:
> Hello all!
>=20
> This is the first time I have ever reported anything linux related, so
> if this is not the proper way, please let me know what the correct way
> is.
>=20
> I am using an NVIDIA Jetson Orin Nano developer platform.  They
> release what they call a jetpack that comes with linux and their
> additions on top.  We are using the latest version they release (just
> released about a month ago)

Something like a distro? What version?

>=20
> When I plug in a USB WiFi adapter that uses the rt8000usb driver, if I
> connect to a network it sees, I get a kernel panic.  If I have
> "automatically connect" it kernel panics when I plug the USB in.
>=20
> The version of the kernel they ship is:
>=20
> 5.10.120-tegra. (tegra is their additions)
>=20
> I talked with NVIDIA first on what I was seeing and after looking at
> my log, they said it is likely a driver problem.
>=20
> Right after I plug in the device, this is the sequence of messages I see:
>=20
> [  264.400281] BUG: scheduling while atomic: NetworkManager/622/0x00000203
> [  264.408778] BUG: scheduling while atomic: NetworkManager/622/0xfffffdff
> [  264.417178] BUG: scheduling while atomic: swapper/2/0/0x00000504
> [  264.423685] bad: scheduling from the idle thread!
>=20
> Then it panics
>=20
> Sometimes it prints more, like:
>=20
> [   21.657382] BUG: scheduling while atomic: NetworkManager/630/0x00000203
> [   21.664818] WARNING: CPU: 4 PID: 630 at
> kernel/rcu/tree_plugin.h:297 rcu_note_context_switch+0x50/0x540
> [   21.675028] ---[ end trace 62dc42c98ec427c8 ]---
> [   21.679873] BUG: scheduling while atomic: NetworkManager/630/0x00000505
> [   21.687591] WARNING: CPU: 4 PID: 0 at kernel/rcu/tree.c:624
> rcu_eqs_enter.isra.0+0x128/0x130
> [   21.696512] ---[ end trace 62dc42c98ec427c9 ]---
>=20
> I've also seen this:
>=20
> [   27.885487] Unable to handle kernel paging request at virtual
> address 0000000000001000
> [   27.893656] Mem abort info:
> [   27.896524]   ESR =3D 0x86000004
> [   27.899664]   EC =3D 0x21: IABT (current EL), IL =3D 32 bits
> [   27.905124]   SET =3D 0, FnV =3D 0
> [   27.908257]   EA =3D 0, S1PTW =3D 0
> [   27.911480] user pgtable: 4k pages, 48-bit VAs, pgdp=3D00000001110cb000
> [   27.918090] [0000000000001000] pgd=3D0000000000000000, p4d=3D000000000=
0000000
> [   27.925066] Internal error: Oops: 86000004 [#1] PREEMPT SMP
> [   27.930794] Modules linked in: mtd_blkdevs(E) mtd(E) lzo_rle(E)
> lzo_compress(E) zram(E) ramoops(E) reed_solomon(E) bnep(E) loop(E)
> rt2800usb(E) rt2x00usb(E) rt2800lib(E) rt2x00lib(E) aes_ce_blk(E)
> rtl8822ce(E) mac80211(E) crypto_simd(E) cryptd(E) rtk_btusb(E)
> snd_soc_tegra186_asrc(E) input_leds(E) snd_soc_tegra186_dspk(E)
> snd_soc_tegra210_ope(E) aes_ce_cipher(E) snd_soc_tegra186_arad(E)
> snd_soc_tegra210_iqc(E) ghash_ce(E) btusb(E) snd_soc_tegra210_mvc(E)
> snd_soc_tegra210_afc(E) sha2_ce(E) btrtl(E) snd_soc_tegra210_amx(E)
> snd_soc_tegra210_dmic(E) snd_soc_tegra210_adx(E) r8168(E)
> snd_soc_tegra210_adsp(E) snd_soc_tegra210_admaif(E) sha256_arm64(E)
> btbcm(E) snd_soc_tegra210_mixer(E) snd_soc_tegra210_sfc(E)
> snd_soc_tegra210_i2s(E) cfg80211(E) snd_soc_tegra_machine_driver(E)
> snd_soc_tegra_pcm(E) sha1_ce(E) btintel(E) snd_hda_codec_hdmi(E)
> snd_soc_tegra_utils(E) snd_hda_tegra(E) snd_soc_simple_card_utils(E)
> snd_soc_spdif_tx(E) nvadsp(E) snd_soc_tegra210_ahub(E)
> snd_hda_codec(E) userspace_alert(E)
> [   27.930905]  snd_hda_core(E) tegra_bpmp_thermal(E) nv_imx219(E)
> spi_tegra114(E) tegra210_adma(E) nvidia(OE) binfmt_misc(E) ina3221(E)
> pwm_fan(E) nvgpu(E) nvmap(E) ip_tables(E) x_tables(E) [last unloaded:
> mtdblock]
> [   28.042400] CPU: 4 PID: 630 Comm: NetworkManager Tainted: G
> W  OE     5.10.120-tegra #1

Out-of-tree modules, right?

> [   28.051233] Hardware name: Unknown NVIDIA Orin Nano Developer
> Kit/NVIDIA Orin Nano Developer Kit, BIOS 4.1-33958178 08/01/2023
> [   28.062910] pstate: 60400089 (nZCv daIf +PAN -UAO -TCO BTYPE=3D--)
> [   28.069071] pc : 0x1000
> [   28.071586] lr : arm_smmu_dma_sync+0x40/0x70
> [   28.075965] sp : ffff8000100231a0
> [   28.079365] x29: 0000000000001000 x28: ffff4655c01d0ec0
> [   28.084817] x27: ffffaced1f227000 x26: ffff4655c6ee32c0
> [   28.090270] x25: 0000000000000000 x24: ffffaced1e405858
> [   28.095718] x23: ffff46572e84ae00 x22: ffff4655c6ee2c40
> [   28.101165] x21: ffff4655c82c3480 x20: ffffaced1db49e08
> [   28.106618] x19: ffff8000100231c0 x18: 0000000000010101
> [   28.112073] x17: 0000000000cccccc x16: ffffaced1d23382c
> [   28.117520] x15: 0000000000000000 x14: 0000000000000000
> [   28.122970] x13: 0000000000000001 x12: 0000000000000000
> [   28.128421] x11: 0000000000000008 x10: 0000000000000ab0
> [   28.133863] x9 : ffff800010023180 x8 : ffff4655c6ee3750
> [   28.139309] x7 : 000000067eb29c20 x6 : 0000000000000238
> [   28.144763] x5 : 00000000410fd420 x4 : 0000000000f0000f
> [   28.150214] x3 : 0000000000001000 x2 : ffff4655c82c3480
> [   28.155658] x1 : ffffaced1db49e08 x0 : ffff465704c37558
> [   28.161107] Call trace:
> [   28.163620]  0x1000
> [   28.165777] Code: bad PC value
> [   28.168911] ---[ end trace 62dc42c98ec427ca ]---
> [   28.183964] Kernel panic - not syncing: Oops: Fatal exception
> [   28.189864] SMP: stopping secondary CPUs
> [   29.275883] SMP: failed to stop secondary CPUs 0-5
> [   29.280811] Kernel Offset: 0x2ced0d200000 from 0xffff800010000000
> [   29.287066] PHYS_OFFSET: 0xffffb9ab40000000
> [   29.291360] CPU features: 0x08040006,4a80aa38
> [   29.295832] Memory Limit: none
> [   29.309234] ---[ end Kernel panic - not syncing: Oops: Fatal exception=
 ]---
>=20
> (This one I believe when I started with the wifi adapter connected to
> USB3 and networking was set to automatically connect.
>=20
> I see in the git repo that these drivers have been changed over the
> last few years.  Given the age of the kernel that NVIDIA is using, I
> am not sure how to correlate changes listed in the history of the
> files with the release.  I guess I could download and diff them until
> I figure out where.

Where?

>=20
> I'm just not sure where to go from here.  I do know without question,
> older versions of these drivers work on the Jetson Nano and Raspberry
> Pi 3 which are MUCH older kernels.

What version?

Confused...

--=20
An old man doll... just what I always wanted! - Clara

--zlCIcyjmXaMZlAlu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZRj/nAAKCRD2uYlJVVFO
o1/uAP9U5c+HrCnrgS9+9Fz84uFAVGGXGNNCchVTz4xKlXb4cwD+P/3vhahwAQpE
I5Jgd6FkdvFx1EOhylnVvJg4ej7R8Q4=
=LHJ5
-----END PGP SIGNATURE-----

--zlCIcyjmXaMZlAlu--
