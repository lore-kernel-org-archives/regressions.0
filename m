Received: from mail-ej2-f41.google.com (mail-ej2-f41.google.com [74.125.228.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E0528E0F
	for <regressions@lists.linux.dev>; Tue,  6 Oct 2026 00:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791245848; cv=pass; b=tJeN7hUR5c0rfsD/zAOchTmMvS8j7Zwk/qPxVJWKjL/JF7vczuKzAvZBjYTIW3ZhJCckrQ3UhsclVaZEg0J0WEfaPxItzX35V2khkuprx7riEoBeRkLBR5G7XpmaQOpkZqYU3G5Sr4dmBStFEQEQIekRoX2/KqaId0c2qJsJrRw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791245848; c=relaxed/simple;
	bh=0JmaGJYuh35nK/8BZ4H4U/00AGleisLG2T3mzgxan0Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WzBzqZvZ+UXWI40FWJxNqhEnWqZbPGOraQJ1cSlyhP8J6VjFWpSodtYP9P3sXe78ymAsUfS4gN8c8PTqnAdgtDSYKybT+X9JWgOflW3WaQbDnNLXZgrBWXT7m5PNtAgSLWdqVn1snkYt5sijVc4+e6P2hBBLXlZ0wLNm9Y0kpZc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MW89UU56; arc=pass smtp.client-ip=74.125.228.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MW89UU56"
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c2e1195040aso375045566b.2
        for <regressions@lists.linux.dev>; Mon, 05 Oct 2026 17:17:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791245844; cv=none;
        d=google.com; s=arc-20260327;
        b=HfvNQVTnvLA1M1ouNwsdhe5V4CFp4eiT0udPpwCDxU3mullkLmowO5Ai0lshIje86y
         PDpbE09lBPS6iTBwSl4aT+DzJiMXTQH/zh2/u9xQCb8rNuNlSIoJyeZF13sdobjUEt/o
         phVS23R7VfG+azbsfMkb4rAVb8RSDN1bCPiVBYkmUwvpTvMnPMfS9LZxVHV0/2yneCVf
         agHCYg6TiuqzWbui/9NLlWd5y/+YnCjWsiZ0TK+gMSyMjXchB8hwqKLBEENZJBfrQCfL
         fceloSBNMxBadYr2pEYIN9nPP+ca2upfwsHWYNyY/d/V7L2gUymVXxjrT8Dns3f+2Qi/
         o2gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r07T5TDn8OOFFjXx1vrgbi8gxWdkxcMtTsy75pUL8B0=;
        fh=Qr951HAthPWBDJ9289HF/Kpb8t3EkaYaSbrFOcTqiXo=;
        b=EQEL/rDUea3aDxjhMImGJi/8KfLz9s7T+TBF8Hx7aGFWV7Ul7IC0sWR+ku/LuLIfR+
         A87Jhgz1+f4FJbP+r5IgMhR6MC7b5FbMFpd2AtuRr/EkvldJtWXgSU4WdzcLa5PK9W3P
         PWg17oT7WdgTTQmda5IBLpEvKzoNQQY8PjOjk/DJZUuZLZYtohn1nW3SoWGX9+nM2UOI
         ie+YYfdz8UT0C8YNZfQ7iEhX7bE8uTcQOs7vxf+PKcOnbnPKSRY0X7Ohjz0PSeisJKVV
         hkQo7RVPGxnaPPbRbctEajaGMLmKqdkZ/Wn9njmMIYfN3mBI8y6/BAvtLcLTg6iBOAsI
         rC9w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791245844; x=1791850644; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r07T5TDn8OOFFjXx1vrgbi8gxWdkxcMtTsy75pUL8B0=;
        b=MW89UU56easQeze8ja1xGIV3dOJn1EJZK9XUBQ/AgjreCGKU5LKBeACLAWUuaUg2Ct
         q1jFK3E+B+MFHO8ZNGKgB0JvR9FbsfhblkUNQu1U8cyvDHZUI52Rn2XOXM/NmUw9Ygpu
         /HBsgWKuWOGVJwVtCwmhFfpHjxGRiUe1ykb0qsA8Y91OKkB8GoAMYaiLNY0SdRacWwd+
         gKE6imkrlIhvGpfxdaZx+VTP0m6E0EEeI5Jm4nWsv2xtvi/S0Vwx2K1Mh0mlOvIlyfYT
         4Dy2ealB+XNhFkgbqzGGjtet3gnGOz9ijYZ5eM/2uw0ejWLoc2Kx0xIMSUhKrW3JzxVi
         19ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791245844; x=1791850644;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r07T5TDn8OOFFjXx1vrgbi8gxWdkxcMtTsy75pUL8B0=;
        b=YU8X6OaxXxw+dggt3FktBsrV4TBtH+tJm+Rx08AqThrQLtwJ0VWcQO3yXmLhxJ02Kv
         vUriS/ZcyA2phdGgBI7NhQXedbeEUspW1zmNHf+tC5LrdLPNcRVXgQdvtJyzgYy05w+P
         1dbRSo6Q5qGR41Sczafc8xZp2FR1TSBv9z45qoYbgyO02crMC3cp1zage1oxOhoL+FI/
         fYnJOnYFK2DLme0vmiw2dsx5r/HEiSF3yMsi8S1qle7ugpbke8cfP8CDJPVybNOzIxIM
         rM/FJ31Bh5tfgGdrhlQrH4znGf5M49uVqQTv8rq2VQ0g3EhCbKIXeypF033WzsaEiI9I
         0BoA==
X-Forwarded-Encrypted: i=1; AKwUvBzF2JnkWCYh8v4rNYjsnte8SLjsToDiQHknJvoRv5fdWA0wNflLA18xeWu0f7/3ZXE8bGrBVQOTsSpG+A==@lists.linux.dev
X-Gm-Message-State: AFuF++mlsNQNCgI7YxhBP0XRlRIhTVArkruVH/odPE0rGMJ6CCZmzcQG
	MOZO7nvdTz4eVIr+IQxapsEYJ8J5AROBiSamxlnzB92f1c3BwvTHH+IgE+IIRcYNpaqD8NM66kN
	XqpiSR7kt6YoQXbScbAQSYe1EMSt9k4Q=
X-Gm-Gg: AYBFou1IpfreGZYgtEAvdfbVNxFjuDrZFKe32Eq8NINGsi3dZ3RFU6SCtD0/LLsJssM
	EkuhMfjy0DvCZs2K8elwgk/IqkteRqbX3vz8CbnISaMVsR16wS9iwvkddweH5hcBmtp0lBWm52U
	Eh3uXF3cRI/nEgkKKBUP8NRLULLt5zmXYk9BLQXp09sFShDjXYtQCbX7BveqaMc4rYcYj8Ysn4i
	ROipqCevpdyQQP8XRh1urRLK9RVgSt5APwBfBCRmijPKp3ezFlUepHOPi2OgAkgovpI1RewK/Wr
	WnDk4KoMJz8/UNKjwV1fyTij6Wcc7Vqlz6Cvt1c+VQAcoHopfpMIUMPWSb+rpr8JQPD7UyAO81K
	Q2b7Mz9ucTWbvR8Q94CuCJQ5I9hmc0B3dzvQPoZHbZKSOQYr+FSdqVw3jQ1BDb75k7PT4Y11Q9Z
	ZMfRHi7HccdS6GJSy3OVOM
X-Received: by 2002:a17:907:3f87:b0:c2e:856:2a08 with SMTP id
 a640c23a62f3a-c2e4a9b37a6mr1060029566b.1.1791245843786; Mon, 05 Oct 2026
 17:17:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABZrw2HcaOh3DHTJtxU5dXrb3Vg19scr6+qR-xe_+R7rME35_Q@mail.gmail.com>
 <20261005231914.GA639967@bhelgaas>
In-Reply-To: <20261005231914.GA639967@bhelgaas>
From: "Perlow, Jason" <jperlow@gmail.com>
Date: Mon, 5 Oct 2026 20:17:12 -0400
X-Gm-Features: AclHuK9j27Ioljx_xBUUxI-DWOiypXojWI1vytbx4TSp5zELb0QExA5yqlQi7EQ
Message-ID: <CABZrw2F=pOOq7+puKohtYMihYqWCevCFc7rkAOETW4T5Nf4n8Q@mail.gmail.com>
Subject: Re: [REGRESSION] PCI/AER: MacBookPro16,1 powers off ~20 s after boot
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Lukas Wunner <lukas@wunner.de>, Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev, 
	Aditya Garg <aditya.garg@linux.dev>, Alex Deucher <alexdeucher@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bjorn, Lukas,

Thanks for the pointer. I ran that experiment on the same
MacBookPro16,1.

Kernel: v7.3-rc6 (a90ee4305c4a) plus exactly the two top commits of
l1k/linux aer_unbound, and nothing else (no T2 patches, no revert, no
diagnostic parameter):

  9ce840949ee9 PCI/ERR: Always notify drivers of slot reset
  db16ca536fd0 PCI/ERR: Allow unbound devices to recover from
               Uncorrectable Errors

The first one conflicts trivially in drivers/pci/pcie/err.c on rc6
(the TODO comment in its context is already gone); I resolved it by
making the same removal. The second applied cleanly. Same trimmed
config and boot recipe as my earlier bisect (console only, no
graphical session).

Result: the machine still loses power. It answered over ssh at about
16 s of uptime and the journal of that boot ends at 16.9 s with no
shutdown sequence. Unmodified v7.3-rc6 powered off at 16.7 s in my
earlier test, so these two commits make no difference here.

So on this machine the failure is not the "link reset before a
driver is bound" case from Alex's report. As in my earlier tests no
AER error message is logged before the power loss (only the usual
"OS assumes control of AER" line) and the Uncorrectable Error Status
registers are clear.

For reference, the earlier result with a diagnostic boot parameter
that leaves the Advisory Non-Fatal bit masked per device:

  masked only on 04:00.2 (Apple T2 Secure Enclave, 106b:1802):
      stays up (120 s)
  masked only on 04:00.0 and 04:00.1 (NVMe, T2 Bridge):
      power off at 14 s
  masked on all four Apple functions 04:00.0-.3: stays up (343 s)

So here the trigger is unmasking Advisory Non-Fatal Errors on that
one function. It looks like a second, separate way for
eddba19b8b5f to hurt a platform.

Would you accept a quirk that keeps the bit masked on Apple
106b:1802? I am happy to write and test that, or any other patch you
would like tried on this machine, and I can send lspci -vvv and the
journals.

Thanks,
Jason


On Mon, Oct 5, 2026 at 7:19=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.org> w=
rote:
>
> [+cc Alex]
>
> On Mon, Oct 05, 2026 at 01:53:55PM -0400, Perlow, Jason wrote:
> > Hi Lukas, Bjorn,
> >
> > Since commit eddba19b8b5f ("PCI/AER: Support Advisory Non-Fatal
> > Errors"), first in v7.3-rc1, an Apple MacBookPro16,1 (T2 chip) loses
> > power 17 to 24 s after boot. v7.2.9 is fine; v7.3-rc5 and v7.3-rc6 are
> > not. Bisection lands on that commit, and v7.3-rc6 with only that
> > commit reverted no longer powers off. aer.c has not changed since, as
> > of v7.3-rc6-3, so I expect it is still unfixed; I did not find an
> > existing report.
>
> Alex reported something similar at
> https://bugzilla.kernel.org/show_bug.cgi?id=3D222095.
>
> Can you try the experiment mentioned there?  The patches Lukas
> mentioned don't apply cleanly on v7.3-rc1, but the conflict looks
> trivial?
>
> > Hardware
> > --------
> >
> > MacBookPro16,1 with an AMD Navi 14 dGPU and the Apple T2. The bisect
> > machine has a Core i7-9750H; a second unit of the same model, used for
> > cross-checks, has a Core i9-9980HK. I have not tested any other T2
> > model. The internal SSD, the T2 and the audio device are functions of
> > one Apple PCIe device behind root port 00:1b.0:
> >
> >   04:00.0 Apple ANS2 NVMe          [106b:2005]
> >   04:00.1 Apple T2 Bridge          [106b:1801]
> >   04:00.2 Apple T2 Secure Enclave  [106b:1802]
> >   04:00.3 Apple Audio Device       [106b:1803]
> >
> > Symptom
> > -------
> >
> > The machine powers off abruptly 17 to 24 s after boot. There is no
> > shutdown sequence; the previous boot's journal simply ends. Nothing is
> > logged beforehand: no AER message, no oops, no lockup, no thermal
> > event. The T2 controls power on these machines, so I assume (but
> > cannot show) that the T2/SMC removes power.
> >
> > Bisect
> > ------
> >
> > v7.2.9 good, v7.3-rc5 bad. Vanilla mainline trees, no out-of-tree
> > patches in the kernel image, CONFIG_PCIEAER=3Dy,
> > CONFIG_ACPI_APEI_GHES=3Dy, kernel messages captured over the network.
> > 19 steps, 4 skipped because those trees oops early for an unrelated
> > reason (the ones I looked at were in thunderbolt icm_probe at about
> > 5 s). Good boots were watched for 55.8 to 69.7 s; bad boots stopped
> > logging between 17.9 and 24.1 s. The complete history, every commit
> > tested and every result, is in Appendix B, and the exact method in
> > Appendix A. The result:
> >
> >   # first bad commit: [eddba19b8b5f] PCI/AER: Support Advisory
> >   # Non-Fatal Errors
> >
> > Revert test, v7.3-rc6, same config:
> >
> >   v7.3-rc6 unmodified:            powers off at 16.7 s
> >   only eddba19b8b5f reverted:     survives the full 64 s capture
> >
> > With that revert on top of 7.3.0-rc6 plus the out-of-tree t2linux
> > series (one kernel image, built once), a normal desktop runs on both
> > MacBookPro16,1 units: the second one has been up for more than 45
> > minutes, and the bisect machine ran sessions of 32 and 22 minutes.
> > For completeness: the bisect machine once lost power after about 10
> > minutes while I was manually switching the display mux and powering
> > off the AMD GPU, which I do not expect the firmware to support. I
> > have not established the cause and have no evidence either way on
> > whether it is related.
> >
> > Which devices are affected
> > --------------------------
> >
> > On v7.2.9, where the Advisory Non-Fatal Error bit is still masked, the
> > Correctable Error Status register has AdvNonFatalErr latched on
> > exactly these functions, with every Uncorrectable Error Status
> > register clear:
> >
> >   04:00.0 04:00.1 04:00.2 04:00.3  (the Apple device above)
> >   01:00.0 AMD Navi 10 XL PCIe switch upstream port [1002:1478]
> >
> > The pattern is identical on both MacBookPro16,1 units (same model, so
> > this says nothing about other T2 models). The Titan Ridge 4C bridges
> > and NHI on the same machine do not have the bit set.
> > These devices report the advisory bit without any matching
> > Uncorrectable Error status, which looks like the "non-compliant
> > products" case the commit message mentions.
> >
> > Only one of the two machines was used for the bisect and the
> > power-off tests above. I have not yet booted an unreverted 7.3 kernel
> > on the second one, so I cannot yet say that the power-off reproduces
> > there.
> >
> > Control: an ASUS ROG Zephyrus M15 GU502LV (i7-10750H, RTX 2060, no
> > T2) has the same bit latched on its NVIDIA TU106 functions
> > [10de:10f9, 10de:1ada, 10de:1adb] and on Titan Ridge 2C [8086:15e7,
> > 8086:15e8, 8086:15e9]. It ran a 7.3.0-rc6 build with the commit
> > applied (plus the t2linux series) for more than 15 hours without a
> > problem, and the same reverted kernel image as above also runs on it
> > normally. So unmasking the bit is not harmful in general; something
> > specific to the T2 platform is.
> >
> > What I do not know
> > ------------------
> >
> > Which device triggers the power-off, and why. My guess, and it is
> > only a guess: treating a possible Advisory Non-Fatal Error as
> > non-Advisory and recovering through the uncorrectable path resets or
> > disturbs a T2 function, and the T2 then powers the machine down. I
> > intend to build a diagnostic kernel that can leave the bit masked per
> > device to find out which one.
> >
> > Possibly related, different symptom: "PCI/portdev: Disable AER for
> > Titan Ridge 4C 2018" (Atharva Tiwari, January 2026) concerned AER
> > warnings on T2 iMacs.
> >
> > What I am asking
> > ----------------
> >
> > Which direction would you prefer: a revert, or a quirk that keeps
> > Advisory Non-Fatal Errors masked on the affected Apple functions (and
> > possibly the AMD switch port)? The t2linux project carries a revert
> > for now: https://github.com/t2linux/linux-t2-patches/pull/70
> >
> > I can test patches on real hardware and can provide full lspci -vvv
> > output, the complete bisect log and the captured boot logs.
> >
> > #regzbot introduced: eddba19b8b5f76d57424ee328a68fd495c5db857
> >
> > Thanks,
> > Jason Perlow
> >
> >
> > APPENDIX A - METHOD
> >
> > Machine: one MacBookPro16,1 for every boot below, running a Debian
> > trixie userland from its internal SSD. The distribution's 7.2.9 kernel
> > was the default boot entry between tests.
> >
> > Build: git bisect in a clone of torvalds/linux (git.kernel.org). Each
> > candidate was built on a separate x86-64 build host (16 threads, gcc
> > 15.2.0, binutils 2.46) with the same recipe:
> >
> >   cp bisect-trimmed.config .config
> >   make olddefconfig
> >   make -j10 bindeb-pkg LOCALVERSION=3D-bisN-vanilla-rc0 \
> >        KDEB_PKGVERSION=3D<release>-1
> >
> > bisect-trimmed.config is a 7.3.0-rc5 configuration trimmed to build
> > quickly (2068 options built in, 204 modules). It has CONFIG_PCIEAER=3Dy=
,
> > CONFIG_PCIE_DPC=3Dy, CONFIG_PCIEASPM=3Dy, CONFIG_ACPI_APEI=3Dy and
> > CONFIG_ACPI_APEI_GHES=3Dy. The same file was used for all 19 steps and
> > for both v7.3-rc6 tests. No out-of-tree patches were applied to the
> > kernel. The release strings come from each tree's Makefile, so commits
> > on 7.2-based topic branches show as 7.2.0.
> >
> > Boot: the .deb packages were installed on the laptop and booted through
> > a one-shot rEFInd entry; the default entry stayed the stable kernel.
> > Kernel command line for every test boot:
> >
> >   console=3Dtty0 ignore_loglevel keep_bootcon initcall_debug
> >   printk.time=3D1 log_buf_len=3D16M panic=3D0 fbcon=3Dfont:TER16x32
> >   systemd.show_status=3D1 systemd.unit=3Dmulti-user.target
> >   modprobe.blacklist=3Dsbs,sbshc
> >   systemd.mask=3Dncz-usb2-rescan.service
> >   systemd.wants=3Dncz-netlog.service
> >
> > (plus the root=3D options). So there was no graphical session. sbs and
> > sbshc are the ACPI smart battery drivers; ncz-usb2-rescan is an
> > unrelated distribution boot workaround. Steps 13 to 19 and the two
> > v7.3-rc6 tests also had module_blacklist=3Dthunderbolt,t2thunderbolt,
> > added after the early oopses (in thunderbolt icm_probe, at about 5 s)
> > had cost several skipped steps. Steps 1 to 12 ran with Thunderbolt
> > enabled.
> >
> > Capture: a small userspace unit (ncz-netlog.service) streams /dev/kmsg
> > and the journal over TCP to a second machine from early multi-user
> > boot, so captures begin at roughly 10 s of uptime. Each capture file
> > records the uptime of its last line.
> >
> > Verdicts:
> >   good: the machine kept running and logging past the point where bad
> >         kernels die (the cut always came before 25 s).
> >   bad:  the capture stops before 45 s, the machine stays unreachable
> >         for at least 60 s, and the next boot's journal shows the
> >         previous boot ending with no clean shutdown.
> >   skip: a kernel oops or panic in the capture or the previous boot's
> >         journal.
> >
> > After a cut the laptop does not restart by itself, so it was powered
> > on by hand and booted the stable kernel; the verdict was then confirmed
> > from the previous boot's journal.
> >
> > Caveats:
> >   - One machine was used for the bisect and for the power-off tests.
> >   - No desktop session was running.
> >   - sbs/sbshc were blocked on every boot, and Thunderbolt from step 13
> >     on.
> >   - The laptop was powered from, and networked through, a Thunderbolt
> >     dock during the bisect. An earlier test of a T2-patched
> >     7.3.0-rc5 kernel with the dock unplugged also lost power, but I
> >     did not repeat the bisect undocked.
> >   - Out-of-tree DKMS modules for the T2 hardware (t2smc, t2gmux,
> >     t2smp, t2thunderbolt) were installed for these kernels and may
> >     have been loaded, which would taint them. An earlier test with
> >     those modules blocked still lost power.
> >   - Step 12 ran 816 s before an unrelated oops, so it did not show
> >     the cut and was treated as a skip rather than as good; this does
> >     not change the result.
> >   - The device that triggers the cut is not identified.
> >
> > APPENDIX B - FULL BISECT HISTORY
> >
> > Good: v7.2.9 (5fce161649b4). Bad: v7.3-rc5 (72d3fcf802c4). The first
> > commit tested is the merge base, "Linux 7.2". Observed =3D uptime of th=
e
> > last line captured. Results: 8 good, 7 bad, 4 skip.
> >
> >  #  commit        result observed   subject
> >  1  8d3ae59288f1  good   55.8 s     Linux 7.2
> >  2  56ea4e86832d  good   67.7 s     nstree: check listing permission
> >                                     before taking a namespace ref
> >  3  93e4b3076b5f  bad    24.1 s     Merge tag 'char-misc-7.3-rc1'
> >  4  21bd0802cd3f  good   60.1 s     Merge tag 'for-linus' (rdma)
> >  5  0b0e645ed2c8  bad    22.9 s     Merge tag 'auxdisplay-v7.3-1'
> >  6  e5f92606156a  good   69.5 s     Merge tag 'mm-nonmm-stable-2026-08-
> >                                     22-16-57'
> >  7  b6b019a1d9b9  good   69.2 s     Merge tag 'parisc-for-7.3-rc1'
> >  8  b130a2caf5d3  skip   oops 5.3 s Merge branch
> >                                     'pci/controller/tegra264'
> >  9  455b454c87bb  good   69.0 s     i3c: mipi-i3c-hci: Add support for
> >                                     AMD_PT I3C controller
> > 10  9bb52aa1972d  skip   oops 5.5 s Merge branch
> >                                     'pci/controller/dwc-meson'
> > 11  b4b07fb82b9e  skip   oops 5.3 s Merge branch 'pci/wake'
> > 12  651fb94aaf24  skip   oops 816 s alpha/PCI: Fix I/O port accessor
> >                                     argument order in
> >                                     pci_legacy_write()
> > 13  625ae0ff41e5  bad    19.9 s     Merge branch 'pci/dt-binding'
> > 14  9f91b2b716a0  bad    19.1 s     Merge branch 'pci/procfs'
> > 15  ea55835bc538  bad    23.3 s     Merge branch 'pci/dpc'
> > 16  d358e9ad15c2  bad    22.3 s     Merge branch 'pci/aer'
> > 17  8446e1147f65  good   69.7 s     PCI/AER: Deduplicate logging of
> >                                     Error Source Identification
> > 18  f141f74c45c6  good   67.6 s     PCI/AER: Move retrieval of FEP and
> >                                     TLP Log into helper
> > 19  eddba19b8b5f  bad    17.9 s     PCI/AER: Support Advisory
> >                                     Non-Fatal Errors
> >
> > Full hashes of the decisive steps:
> >   eddba19b8b5f76d57424ee328a68fd495c5db857  (first bad)
> >   f141f74c45c6f774eebdb7e45bd609be5122bfa8  (last good before it)
> >   8446e1147f65563d374ffa54dc3ba81adb1342c5
> >
> > The v7.3-rc6 tests (a90ee4305c4a) used the same recipe and command line=
:
> > unmodified, power off at 16.7 s; with only eddba19b8b5f reverted,
> > survived the full 64 s capture.
> >
> > --
> > Jason



--=20
Jason Perlow | Argonaut Media Communications

Voice/Text  (954) 242-3484 | jperlow@gmail.com | Blog: techbroiler.net
Read my Tech and Food Industry articles: https://linktr.ee/jperlow
Bluesky: https://bsky.app/profile/jperlow.bsky.social

Need to schedule a meeting with me? https://bit.ly/3y8P3Gp
