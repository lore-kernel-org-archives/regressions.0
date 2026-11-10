Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794354024;
	b=5oOubbSJsdr7ZLJ/XCMkqqsi0RKS+2/jjjS3zHwQfiphchaa7nktSRrEHMm+d2U+tes+
	 MtWlggQcfNJZt1VoiGDEYIhd7TXJPwLroJ3FWL7wKnudGfuI9r23KpJnBuPD8nwxuprqB
	 eFHiPNkmYoAzGeDNbygaHccZxTkbFp6J0u6LuT5hEGCC8zuaCFzm/P43xB6/pvWbiFVYu
	 vfkM0b8KyqHaJeuWbknV/AzeOM6vI6ZGFIlLtbtuW8qwLTzzoZmSEU8f9ZpN7SOdFGYO9
	 u87AuxSOx08aMYuQpwCwK2aoTmHZhnK+57BynRUKikzqBhkPiS8A9qWLnnnHOO1CDpA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794354024;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=QnGd7FYqd1uBq9LqoPDkEcxLfOLIFQl/QxjaadD0DI0=;
	b=CztrkjmYpeBrN0UqJpe7vkNeklpSJ2bkvE98Lp7GqU5wDvtjP7auMyioYarI0OpltZHJ
	 dq02m7qZmXCLn4bvyrVOar5iEshmW2w9mkS4dIWkn8IblmhRfiggE0XvO0j4UrCCBbdEh
	 kWOpKAwl9v9MYLJx6ryJYp7Ae89RWqHV44ie5jkVjv1XHdGrGmO8j+3MKkMA0Mp7kOvNK
	 gnW/zUe5GfVtaJ82kWi+LIyF35dZkVuubeWPuEa/5jzr1rmPxpkDjSjkj5UdD/u0M9cqa
	 sK1u1UND63CZa3n5i8Is60uBJ94XNBZaeRBdorgWmUyioqT7t5XjmP7kGzlw7cFnyhQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vxtinxvV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.47
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30304606A321
	for <regressions@lists.linux.dev>; Tue, 10 Nov 2026 23:40:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30304606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vxtinxvV
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-677bc4704cbso3066330d50.0
        for <regressions@lists.linux.dev>; Tue, 10 Nov 2026 15:40:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794354023; cv=none;
        d=google.com; s=arc-20260327;
        b=GRS4C8wQ7YtRQdho/C+vspzU/fzWaqbNf7ubqGdJxghe8M2OnDRH4bQSA1Ec42qaEH
         1ZC5o4xmxWMotuolWzoFfgNv4y1DLGGn9V8jHhF6DK2SiZW5KK+2lHEIxYoCgrrOs8kX
         idupzQm3zAcEWbVCk6nykXbBIeIiPa9dprrjKu2eebUH9k3DTZUsijamgkRxhnRpuIom
         FLzkTrCma1Nmy4Oeg2ZqbL6spjAfR76M92UyeyizRtuC+Yyq+cgPnTNsvTgC5HvAf5aB
         p8L6XO4colvDsaPu9b5gWnsCcGlob0L4WGmA2M39WDZh+C3yv1Ujk4GLVoVBHlUPmCmM
         sQBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QnGd7FYqd1uBq9LqoPDkEcxLfOLIFQl/QxjaadD0DI0=;
        fh=yOHzWdaAnfLIQQAHu2XSEDRvoqIX9gHgZ5c9md2p5/Q=;
        b=IJYqHSQKbfuFxoPeBiYUYYdBr7kaF7anaW2rCAtenTFISI9hmN8zW6C2QBKD5yh2yu
         mrFDNVjl8W4MqjzpM1UkInSk0c/0Dm+ZerWI31AReGXGWbFamKu3EHSgWlq7IfMPhERy
         +ugIh7aI1SRIc733gB6unOdf4viWREcAikZ1dkntdQDXiwAklF7V3Ih4gqS0Jy/Dfm5J
         ajzUCZK+i6U+0N8OGt1GgVxnwq6pcOCawas/Nkyq8vJwZ+jvqhb6w0/a9+cQiR4ZdMik
         UQL30LkmeCIfFxQnX1l9WcvKbvoaOsHE+8XER71VvZ6ix2a18FuG/S0hFeWChpPZMIIG
         LOKw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794354023; x=1794958823; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QnGd7FYqd1uBq9LqoPDkEcxLfOLIFQl/QxjaadD0DI0=;
        b=vxtinxvV0oCgJ27qucBscINbmESkAK+S3QIE7fXhvZ4FMCGk4JKKTcGNJJPHdIG8GN
         Yyv9rga03elpsShvMhbigo3bY/I9FMQYSA41t6xBe3Y/o3Kz6GPUYHvwPwRbr0MQeNgc
         UaE7PdUzaV9JYK1cWTw2WxOaedFRRnq/diSTieS65DVM2govx+Ypx8LMM3h17E2PvnAB
         6GbEOWJ0i91WZ0E0C2lRz41KGMGi1IIHfkJr4V3xqc6DZCSz44nITFbjJLZaHT0AHZNk
         3o+DD6E1j2ek0bQ+z4lY2VwSHiAoMAR7Ik3Ur9saxmWoFRdxljUGWNkh610qBVDaLgCA
         60eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794354023; x=1794958823;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QnGd7FYqd1uBq9LqoPDkEcxLfOLIFQl/QxjaadD0DI0=;
        b=BY6NziHyAqiH5UlYPFRQlRxveu1jGYZ/IrTXDuPCug6DEGKrXsfuObghn9lDMuBiJa
         zihxUY98pym1ab5mgPOn0enQ3ECv9rd4WYmghxncvFsLOyhqOFssPla0hDgufYQVIvZY
         NnwcExHup1RPeS9nwnBsYlnyOMkySZwjODg7ihbbMvfCK2Xo2i/9Ja3ZyEHZBJ5bZ3Or
         fN6em4YTKB9bSgAAOvuvlRorGx62niFQNGvMdaVNUDj1HrnkrXWH8Wz6kNRtHnfcQTkO
         PoEF2ahDNtjjhAhMDiWMWkCMYEyKbTICxN5Mm/7NapT6JiVht6mtpBkHXR5Yt/T58KVj
         +2sw==
X-Forwarded-Encrypted: i=1; AL+hErHdslxyGZi8Q2PXP1ysf/COzo3olyZsWd1IJOWqVhq3c5ijSd7jOZ2osCZ4tMHWk7fjeVE2Nk5Eg+7VLQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z/gJxLdvX27bItZ6IOjl/jQVTYicV4uR4kYaKxRy2OaUGehcvQE
	GzMs6AuY9bMSTOvf89rkDXZKP/RHoqjoWcfT4mqGk5ew9TMIvBmBDDQOx+TloJHcsN9EbLL2EJt
	GXF8BFmpaJ9rM0SmNHZBZLFFv9SonVsos9CQllFQ=
X-Gm-Gg: AYBFou1JJlmUZ4QqUF/O1zN7wRdw2Hb6QBeCEBJILjNoQNCAB+Q1aY8pHrBEcbjXaRT
	jzTxogiIkf5OY9fQKtRKkRKZhnE37khp9AQSgHRuKi7rtlMGyaO5pU/FlXgiUATFpB9xqnIlJC3
	ytDTVJ+XNHvuDsoAURrhZGiobrMKnywm6Dld0fbo4RDAe9QaJ5a6B9yRrrtbF0iHGhtYYFDoS4j
	KbXWmmqJtbMwIR/JHt5BqIEzLLl/9DBEu5Yag6i+czCwNiqTp4TrNMdrfaihhJaOmEo7AvM3HRA
	G9XiUQocVyrbr3+y88eAQuPZNrDoQPhdWKqbhod6qUBYsvisx6AsO9DL5nzhrFfr3/NQN3b/Tdx
	CNArtP1j8cGXqu658ADTcSuVM+TD3l74EMoNp6Jo0JkMnfTIhJ2FL51otCn/qs205rhJn
X-Received: by 2002:a05:690e:4501:10b0:679:af57:d199 with SMTP id
 956f58d0204a3-67c6801bbd6mr317767d50.57.1794354022902; Tue, 10 Nov 2026
 15:40:22 -0800 (PST)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <bug-222253-41252@https.bugzilla.kernel.org/> <CABhMZUVJjeNUwp_yT3kkyk1U+0MNw0_qF=RU39keKnypd9T2YQ@mail.gmail.com>
In-Reply-To: <CABhMZUVJjeNUwp_yT3kkyk1U+0MNw0_qF=RU39keKnypd9T2YQ@mail.gmail.com>
From: Kameron Markham <kameron.markham@gmail.com>
Date: Tue, 10 Nov 2026 15:40:11 -0800
X-Gm-Features: AclHuK90teGEf5LZoG2KcdkEV1p-gF2vEXTEnnkC3ST9EnQP_eIi2yy4vSgiv0w
Message-ID: <CACpBZmVWnoRCRmvLBTQ2T94NG5Vbyw6wkg5g3crbg1MgpSS6dA@mail.gmail.com>
Subject: Re: [Bug 222253] New: Dell PowerEdge R730 resets at boot since v6.15:
 failed disabled ROM BARs trigger PCI realloc, I350 moved
To: bjorn@helgaas.com
Cc: Linux PCI <linux-pci@vger.kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	regressions@lists.linux.dev, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Mario Limonciello <superm1@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, Bjorn.

For the new Cc's: the mechanism in this report is out of date. The ROM
BAR change was intentional, and I've dropped my patch. After Ilpo's
review I captured the end state. The assignment itself is valid, but
the second pass puts 00:1c.4's window, and the I350's BAR 0, at
0x92200000. That 4K is still decoded by the PCH thermal function
(D31:F6), which the BIOS hides on this C610/Wellsburg platform. The
first MMIO read of the I350 there resets the machine. Reserving the
range with memmap=3D4K$0x92200000 makes stock v6.17 boot normally.

Details:
https://lore.kernel.org/all/CACpBZmUoSU8Emvego8sEce5AbB4+48yMLbs=3DE-5HKMh=
=3D65Zq=3DA@mail.gmail.com/

The new serial logs are attached to the bugzilla entry.

So this looks like quirk territory: reserve the hidden thermal BAR
before resources are assigned. Its address follows the firmware layout
(0x92600000 with SR-IOV Global enabled), so the quirk has to find it
rather than use a fixed range. Ilpo, Mika: is there a supported way to
read the BAR of the hidden D31:F6 on C610/X99, similar to what p2sb.c
does for P2SB?

--=20
Kameron

The investigation and these tests were done with the help of an AI
coding assistant (Claude, by Anthropic); I ran them on the hardware and
checked the results.

On Tue, Nov 10, 2026 at 3:15=E2=80=AFPM Bjorn Helgaas <bjorn.helgaas@gmail.=
com> wrote:
>
> [+cc Ilpo, Mika, Mario, reporter in bcc]
>
> ---------- Forwarded message ---------
> From: <bugzilla-daemon@kernel.org>
> Date: Mon, Nov 9, 2026 at 6:12=E2=80=AFPM
> Subject: [Bug 222253] New: Dell PowerEdge R730 resets at boot since
> v6.15: failed disabled ROM BARs trigger PCI realloc, I350 moved
> To: <bjorn@helgaas.com>
>
>
> https://bugzilla.kernel.org/show_bug.cgi?id=3D222253
>
>             Bug ID: 222253
>            Summary: Dell PowerEdge R730 resets at boot since v6.15: faile=
d
>                     disabled ROM BARs trigger PCI realloc, I350 moved
>            Product: Drivers
>            Version: 2.5
>     Kernel Version: 6.15 - 7.4-rc2
>           Hardware: Intel
>                 OS: Linux
>             Status: NEW
>           Severity: normal
>           Priority: P3
>          Component: PCI
>           Assignee: drivers_pci@kernel-bugs.osdl.org
>           Reporter: kameron.markham@gmail.com
>         Regression: Yes
>            Bisected 96336ec70264
>          commit-id:
>
>
> Since v6.15, a Dell PowerEdge R730 with "SR-IOV Global Enable" disabled i=
n
> the BIOS setup hard-resets during boot when igb probes the on-board Intel
> I350 (8086:1521, behind PCH root port 00:1c.4). v6.14 boots fine.
>
> iDRAC Lifecycle log for a failed boot:
>   PWR2262  The Intel Management Engine has reported an internal system er=
ror.
>   CPU0000  Internal error has occurred check for additional logs.
>   RAC0703  Requested system hardreset.
>   CPU0704  CPU 1 machine check error detected.
> Normally the platform then power-cycles itself and boots the next OS; in =
2
> of the ~17 crashes during testing the BIOS halted in POST instead (PST020=
8
> "System BIOS has halted") and needed a power cycle.
>
> The same signature (PWR2262 / IERR on kernels >=3D 6.17, on R630/R730/XC7=
30xd
> with I350) is reported by Proxmox users:
>   https://forum.proxmox.com/threads/186063/
>   https://forum.proxmox.com/threads/177201/
> There, enabling X2APIC Mode, I/OAT DMA and SR-IOV Global in the BIOS is t=
he
> usual workaround. On this machine only SR-IOV Global Enable matters (see
> below).
>
> Hardware / firmware:
>   Dell PowerEdge R730, 2 sockets, BIOS 2.19.0 (also reproduced on 2.11.0)=
,
>   iDRAC8 2.75. On-board: 82599 (8086:10fb) on CPU root port 00:03.0,
>   PERC H730P Mini (1000:005d) on 00:01.0, I350 (8086:1521) on PCH root po=
rt
>   00:1c.4. BIOS: X2APIC, I/OAT and SR-IOV Global disabled unless stated.
>
> Bisection (v6.14 good, v6.17 bad; test kernels booted from RAM via PXE, a
> BAD boot detected through the BMC's SEL):
>   first bad commit: 96336ec70264 ("PCI: Perform reset_resource() and buil=
d
>   fail list in sync")
>   96336ec70264 does not build on its own (pci_resource_is_disabled_rom() =
is
>   not defined anywhere); it was tested with a one-line definition matchin=
g
>   the check it replaced. Its parent e89df6d2beae boots.
>
> Mechanism (from serial console logs with PCI dynamic debug):
>   - The firmware leaves the 82599 VF BARs unassigned, so pci_realloc_dete=
ct()
>     enables reallocation.
>   - On the first pass the disabled ROM BARs of 02:00.0, 01:00.1 and 07:00=
.1
>     fail ("can't assign; no space").
>   - Before 96336ec70264 a failed disabled ROM BAR was not added to fail_h=
ead.
>     96336ec70264 tests that with an idx that is not set for the resource
>     being checked, and 2499f5348431 ("PCI: Rework optional resource
>     handling") removed the test, so the ROM BARs land on fail_head.
>   - "PCI: No. 2 try to assign unassigned res" follows: the windows of
>     00:1c.4, 00:03.0 and 00:01.0 are released and reassigned; the I350 mo=
ves
>     from 0x91a80000 (firmware) to 0x92200000.
>   - The last console line before the reset is igb saving the config space
>     of 07:00.0 with BAR0 =3D 0x92200000.
>   The new address range is free in /proc/iomem; why the platform resets i=
s
>   not known.
>
> BIOS switch matrix with stock v6.17:
>   all three disabled                     -> resets
>   SR-IOV Global only                     -> boots (no realloc, no 2nd rou=
nd)
>   X2APIC + I/OAT, SR-IOV Global disabled -> resets
>   any switches, pci=3Drealloc=3Doff          -> boots (tested with all di=
sabled)
>
> Current mainline v7.4-rc2 still resets. A patch restoring the old behavio=
r
> (do not put a failed disabled ROM BAR on fail_head) makes both v6.17 and
> v7.4-rc2 boot; it follows on linux-pci.
>
> Attachments:
>   sol_v6.17-realloc-off.log       serial console, GOOD (pci=3Drealloc=3Do=
ff), with
> /proc/iomem
>   sol_96336-bad-dbg.log           serial console, BAD, first bad commit, =
PCI
> dyndbg
>   sol_v7.4-rc2-dbg.log            serial console, BAD, mainline
>   sol_v7.4-rc2+fix1.log           serial console, GOOD, mainline + patch
>   sol_v6.17+fix1.log              serial console, GOOD, v6.17 + patch
>   sol_v6.17-stock-sriov-only.log  serial console, GOOD, SR-IOV Global onl=
y
>   git_bisect_log.txt              git bisect log
>   lclog-excerpts.txt              iDRAC Lifecycle log entries for a faile=
d boot
>   harness.tar.gz                  test scripts (addresses replaced by
> placeholders), kernel .config, initramfs
>   lspci-vvv.txt                   from the working v6.8 kernel (BIOS swit=
ches
> enabled; with
>                                   SR-IOV Global enabled the BIOS renumber=
s
> buses, so the
>                                   PERC is 03:00.0 and the I350 08:00.x th=
ere)
>
> Notes: The analysis and patch were prepared with help from an AI coding
> assistant (Claude, by Anthropic); all results above come from test boots =
on
> the machine described.
>
> --
>
> #regzbot introduced: 96336ec70264
> #regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=3D222253



--=20
Kameron Markham
Mechanical Engineer
(253)347-3004

"The most difficult subjects can be explained to the most slow-witted
man if he has not formed any idea of them already; but the simplest
thing cannot be made clear to the most intelligent man if he is firmly
persuaded that he knows already, without a shadow of doubt, what is
laid before him" -Leo Tolstoy
