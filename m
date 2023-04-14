Received: from tilde.cafe (tilde.cafe [51.222.161.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451BC810
	for <regressions@lists.linux.dev>; Fri, 14 Apr 2023 09:07:47 +0000 (UTC)
Received: from localhost (124.250.94.80.dyn.idknet.com [80.94.250.124])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by tilde.cafe (Postfix) with ESMTPSA id 1B2C02057E;
	Fri, 14 Apr 2023 05:07:43 -0400 (EDT)
Content-Type: text/plain; charset=UTF-8
Date: Fri, 14 Apr 2023 12:07:42 +0300
Subject: Re: [REGRESSION] Asus X541UAK hangs on suspend and poweroff (v6.1.6
 onward)
Cc: <stable@vger.kernel.org>, <linux-acpi@vger.kernel.org>
From: "Acid Bong" <acidbong@tilde.cafe>
To: "Linux regressions mailing list" <regressions@lists.linux.dev>, "Bagas
 Sanjaya" <bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <CRWCUOAB4JKZ.3EKQN1TFFMVQL@bong>
X-Mailer: aerc 0.14.0-126-g6d59ad3f02bc
References: <CRVU11I7JJWF.367PSO4YAQQEI@bong>
 <5f445dab-a152-bcaa-4462-1665998c3e2e@gmail.com>
 <b2edf1ed-2777-03ef-4d5e-e355a6074f78@leemhuis.info>
In-Reply-To: <b2edf1ed-2777-03ef-4d5e-e355a6074f78@leemhuis.info>

> Thorsten
> why do you pass pci=3Dnomsi
It's a workaround for another issue i've been facing for about 2 or 3
years, since when I first tried out Linux (started with loading Kubuntu
and Mint live images). Without that workaround Kubuntu didn't boot for
me - on kernel 5.8 it only reached the graphic installer part, but hung
after language selection menu, on 5.4 and 5.11 - didn't even reach the
graphic session. With Mint it was more severe - the screen was flooded
with PCIe errors, like so:

	Apr 10 18:47:08 bong last message buffered 3 times
	Apr 10 18:47:08 bong kernel: pcieport 0000:00:1c.5:   device [8086:9d15] e=
rror status/mask=00000001/00002000
	Apr 10 18:47:08 bong kernel: pcieport 0000:00:1c.5: PCIe Bus Error: severi=
ty=3DCorrected, type=3DPhysical Layer, (Receiver ID)
	Apr 10 18:47:08 bong last message buffered 5 times
	Apr 10 18:47:08 bong kernel: pcieport 0000:00:1c.5:   device [8086:9d15] e=
rror status/mask=00000001/00002000
	Apr 10 18:47:08 bong kernel: pcieport 0000:00:1c.5: PCIe Bus Error: severi=
ty=3DCorrected, type=3DPhysical Layer, (Receiver ID)
	Apr 10 18:47:08 bong last message buffered 13 times
	Apr 10 18:47:08 bong kernel: pcieport 0000:00:1c.5:   device [8086:9d15] e=
rror status/mask=00000001/00002000
	Apr 10 18:47:08 bong kernel: pcieport 0000:00:1c.5: PCIe Bus Error: severi=
ty=3DCorrected, type=3DPhysical Layer, (Receiver ID)
	Apr 10 18:47:08 bong last message buffered 5 times
	Apr 10 18:47:08 bong kernel: pcieport 0000:00:1c.5:   device [8086:9d15] e=
rror status/mask=00000001/00002000
	Apr 10 18:47:08 bong kernel: pcieport 0000:00:1c.5: PCIe Bus Error: severi=
ty=3DCorrected, type=3DPhysical Layer, (Receiver ID)
	Apr 10 18:47:08 bong last message buffered 6 times

`pci=3Dnomsi` saved me also during Debian installation - without it the
live ISO just crashed mid-installation.

But it wasn't a complete cure for Debian- and Ubuntu-based distros, and
they still crashed even with this parameter (I don't know how exactly,
at least they didn't flood with PCIe bus errors).

Since I moved to Manjaro, Void, Arch and now to Gentoo (which bases its
config on the Fedora one), PCIe errors were my only trouble, which was
easily mitigated with `pci=3Dnomsi`. Recently I discovered that without it
one of the kernel modules (irq/124-aerdrv) had high CPU load, so double
useful.

https://forums.linuxmint.com/viewtopic.php?p=3D2237628
Just googled and there's a guy with a very similar model as me (UVK
instead of UAK) and same issues, but `noaer` and `nomsi` work identically
for me (I found `nomsi` in a different thread).

Since I'm building my own kernel for the last 3 months, I've disabled
the MSI in kernel config - and with that, a big part of IOMMU part as well:
https://git.sr.ht/~acid-bong/kernel/commit/cac5c09dec0bea919ca071a9b738108b=
0d8a8ee5
but I did it _after_ I first experienced the issue I described in the
thread head, hoping that it'll save me from these hangs as well. It
didn't.

I'm keeping it in the bootloader config for cases when I boot with a
prebuilt Gentoo kernel, and add every time I'm booting with Arch or Void
live USB for rescue purposes. It's not a constant issue tho, happens every
other time.

---
> Bagas
> Have you tried testing latest mainline?
Just built and will boot in a moment. But we'll gotta wait for a couple
of days, since the hanging is unexpected.
