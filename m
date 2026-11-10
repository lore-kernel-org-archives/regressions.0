Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794352505;
	b=rboY2pFaYT9PLQeXLpSGLiMEFxBo4GaxIwaIS9WTaeqIr/uRebWbpGUnKvpX34Ctbnmv
	 azNK3v0pe9yboDr+t62GzQvq9y2njn5D8cupuw8ZIqCDZN3aRGrVg8GkrGnB3vHq5qZNf
	 6MacmNGpqvZfymN66K8XXXVHEnLtiPFERoJK3qmqbfr4fzfzicGM5YGGXPJjssE/hUXRw
	 g1LY5b8iDRhKNDlx+iDHZBpSI5soOc8PWdjXSDVcuDQiFCt78y17s/RBBUf9Vj0aZpihK
	 Mkz06H8IQNCJIOfPgeNJT2ariw0qHJAfdrwlI+k08nj2K/WJlABEr7XmYMBZfrbif6A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794352505;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=UHoJSqCLvyJwBQ65tIMfan/ByALnrwkzVh6tGfih3LY=;
	b=zbZY+RqSpB4LII2wpdnddxLi+c4YsuLTyQjRFA9oNPcqJz8bbGezBzlLfrssSvPPlOZO
	 3srF+xVYRtV4DUg91q1rFAA/mu0XoXRjVioxWaziYFScYCef1jK2wc+oQfoasCPgaBgpc
	 GO52i9wDq2csxwfmyk4W4HK4HfKZnuMBYKq8228M0GdzVYp+lawnyVvzGT7IsZqt5gNLL
	 0jxZSqNhFJ9s2WIUtkTMalpJrQLSRsSAkwC5z5MdmBT5wuK5KH2TMiPXZgku0EtfEm37P
	 T15kD6FoOGgrEOSHjR8SmbpVllB/9ZssCIy1WrpQjHXGP13fc7sgHAydcQrwyG3NzqQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JmFgLF3I;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.52
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF252606A320
	for <regressions@lists.linux.dev>; Tue, 10 Nov 2026 23:15:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF252606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JmFgLF3I
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5c1593fd141so1152567e87.0
        for <regressions@lists.linux.dev>; Tue, 10 Nov 2026 15:15:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794352503; cv=none;
        d=google.com; s=arc-20260327;
        b=IfZ5dGTMskICE/gKUaofec+ae/IDx0Dwj7MqM31qFZYjvzSV+Latwqpop4xD6Jvgx9
         2Q5BXTjgisz+1HYHS2R0WMXJyDwQLfh/LUq4fEpZseMSZh++ls4WAPxSqU7vbz310wkt
         gOIVOOnOMXyH6oXCkhmpp42sqX04zRWBR1ldBlhb9ifvmNIIZDD4K2dwBTrKj9hXlTOC
         LNiW7fKZrMGq6MTt2GmyLkltOn5bC8T/nd0DU74OprcO/F6RmLIBv5Itu7PF6u4Z3BaG
         ErBaNn2T7TylhFeb8KWKHge1bp1dyogeLjSeTWWX+GbR0gTzT0NublK0KUbDJK0pst1C
         7Geg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=UHoJSqCLvyJwBQ65tIMfan/ByALnrwkzVh6tGfih3LY=;
        fh=jmVCnJWEh5IlXJNYN+O8qmX0dNmlP+O+cnPEUdPVs9k=;
        b=k0fmIZ1w9bHGDwbYi6Ded4PgBHJcxEJ3N02GMvNqPBNt6CCBZQVShuFfAljYj8mYum
         ogva32PdzZVRGb1xmDo5sk9J0mwiC+WFIrUBii0yM0l+ZibuzTUkIxkiG4bnymS3UALF
         XjozywwLLoprAAHU1V5g49QUkc+zoCXd2fv2L4p4GChXo4QP/3otlY+vduNZXXRoLjaC
         tyeUHRx6cte2a86vWca1BGnaJ1wyys66T28jETKv9m7eShqFHzYIl3p2XQXHX+4/qoL1
         Ljs5I4MrOF18b+rx0A2+h5d+TpjmKVygo3oe0VH/R9Iz3IXq0wqmPHOcYQdtpDY2BfJt
         hozA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794352503; x=1794957303; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UHoJSqCLvyJwBQ65tIMfan/ByALnrwkzVh6tGfih3LY=;
        b=JmFgLF3I8HN6BJwiWgQIh6QlGr159bo8PNMILzqmCTV7KucCnVIYviJQ7wUL8DamdH
         J7z0SXtVe/K5ITDWB0cpok3oiaLLmRcahPDzZqrF4aST+/2JxSTjJIkNY6tODXeFgKCr
         PkKtf6nNoGUF/Rm74++eXGfBUqK3AQZIADj6fi/mgd5kaTEhYJUV/GJDSPGRoF2p7tUl
         HB7ByLBLMif7nSTL//hUbFjDIArqlFznuP6RnpT2hqTCqv3aQYc+os+xQWAbTku9wW9N
         Zyip5Qo8U6l7gzo9+bvoQzTBnuSWOA1sE9TZFreuv5WFyRYHhrwcMyTkUY8apdaK8ke1
         3ARQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794352503; x=1794957303;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UHoJSqCLvyJwBQ65tIMfan/ByALnrwkzVh6tGfih3LY=;
        b=DAk+AQ3U5VzW8QxeoKb/msMYS0nhbCE6PouZV3cU3QjQWFFNMAG0gBPVLrgH9Obquo
         XUnXo9ZP613ceUHSVrjWMZlkFzzPTTsAKCqpAesiqsdbqMwPcmXV7T+gbhd2JZp5gwBd
         4qlWKiXJLh26+tMXikIXB6i8Kf4oddv+Z7iBd5gXUimdJ/YT0vIVVhoWPKdzoGEraKuG
         BWwJnT+YTzsSKu34HUl1GXxcPD/t9FMe7FUasMFt+WA/AJtV1SzpRKZKq28Ow4+l5UJa
         Nv+7VwimvG8CxzM0plhCA1X6JHihdtxUUr8C/4hF8sjwHKMzlBqQHTmbWGD1Xp0jAw7C
         TAwQ==
X-Forwarded-Encrypted: i=1; AL+hErGfiZQ8lxcSv6RQU58eMjQGqdv7RsL5dYl144VJJIxKaUfCP6wxWndVB3NaeF80cQ+Tz2Nk+zhaQgmq2g==@lists.linux.dev
X-Gm-Message-State: APuU4Z9rpuiYbKuA+HzGvN9v00KNIHcA3jZs55dOuob++JHFThzg0Xou
	cmewIsu/Nfw0YGXsTYnvG0VjzoivGHXWUIHEQtkRlpi6hE14Cpi3Nh9gU4AoCvOeFWjLe191j8m
	ObawnJAO2EMGLq4pAC4L4EFc5FGraEDc=
X-Gm-Gg: AYBFou3CT0AMvMOnNKln++xHr5WZmLVYPLDVV1rG/nSlOYTvKGwXGlRRtey7G1oLyY1
	hfrQKY1qBEtfwXY2OQh8cyQzPYymxiMFBc43mkgSkpiUeF9+obF6TKNZfWOM3ipuG3NE2eomY2m
	8Sf8t6qK33YlALKaGdd2qmKpcLY5IhgA0DhpmN1N8W9lGAghDYNMH5v8++jP2MQP99OdsLHxelO
	tGpODkrbnnffTn1EPkVAlTUcbbSl++I013x4iEYQ7ippSxnyLGNvWF/5wXyKfqmAOBsvX41Cvyl
	DAPdR7Xw2ASbkIIC/hjPJCUXVh0UcxIod1AEBGmxghBmeVXhTMhh+Ti9gPgirQ+oaYujIg4CtKR
	OliRcnK8ctiolDOnIdbKW68X6mv2Y10POisO3swKn20IKCx1fvENtAifO/kslKutWWNZ+BQk7Si
	LoqJmJxdvPPzLUpCLVu8/agsuJajImr3TlFC3B3sv96lnzrT1izS2Php4wNRWHCUyMmuL8gg==
X-Received: by 2002:a05:6512:2213:b0:5c1:5c9a:fd9d with SMTP id
 2adb3069b0e04-5c15d7680a2mr136511e87.64.1794352502776; Tue, 10 Nov 2026
 15:15:02 -0800 (PST)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <bug-222253-41252@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222253-41252@https.bugzilla.kernel.org/>
Reply-To: bjorn@helgaas.com
From: Bjorn Helgaas <bjorn.helgaas@gmail.com>
Date: Tue, 10 Nov 2026 17:14:50 -0600
X-Gm-Features: AclHuK9vazuIlBsthx05azqG-Zropzp86ELvNih1H0eih_bznMLlD679bmaqlbQ
Message-ID: <CABhMZUVJjeNUwp_yT3kkyk1U+0MNw0_qF=RU39keKnypd9T2YQ@mail.gmail.com>
Subject: Fwd: [Bug 222253] New: Dell PowerEdge R730 resets at boot since
 v6.15: failed disabled ROM BARs trigger PCI realloc, I350 moved
To: Linux PCI <linux-pci@vger.kernel.org>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	regressions@lists.linux.dev, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Mario Limonciello <superm1@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

[+cc Ilpo, Mika, Mario, reporter in bcc]

---------- Forwarded message ---------
From: <bugzilla-daemon@kernel.org>
Date: Mon, Nov 9, 2026 at 6:12=E2=80=AFPM
Subject: [Bug 222253] New: Dell PowerEdge R730 resets at boot since
v6.15: failed disabled ROM BARs trigger PCI realloc, I350 moved
To: <bjorn@helgaas.com>


https://bugzilla.kernel.org/show_bug.cgi?id=3D222253

            Bug ID: 222253
           Summary: Dell PowerEdge R730 resets at boot since v6.15: failed
                    disabled ROM BARs trigger PCI realloc, I350 moved
           Product: Drivers
           Version: 2.5
    Kernel Version: 6.15 - 7.4-rc2
          Hardware: Intel
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: PCI
          Assignee: drivers_pci@kernel-bugs.osdl.org
          Reporter: kameron.markham@gmail.com
        Regression: Yes
           Bisected 96336ec70264
         commit-id:


Since v6.15, a Dell PowerEdge R730 with "SR-IOV Global Enable" disabled in
the BIOS setup hard-resets during boot when igb probes the on-board Intel
I350 (8086:1521, behind PCH root port 00:1c.4). v6.14 boots fine.

iDRAC Lifecycle log for a failed boot:
  PWR2262  The Intel Management Engine has reported an internal system erro=
r.
  CPU0000  Internal error has occurred check for additional logs.
  RAC0703  Requested system hardreset.
  CPU0704  CPU 1 machine check error detected.
Normally the platform then power-cycles itself and boots the next OS; in 2
of the ~17 crashes during testing the BIOS halted in POST instead (PST0208
"System BIOS has halted") and needed a power cycle.

The same signature (PWR2262 / IERR on kernels >=3D 6.17, on R630/R730/XC730=
xd
with I350) is reported by Proxmox users:
  https://forum.proxmox.com/threads/186063/
  https://forum.proxmox.com/threads/177201/
There, enabling X2APIC Mode, I/OAT DMA and SR-IOV Global in the BIOS is the
usual workaround. On this machine only SR-IOV Global Enable matters (see
below).

Hardware / firmware:
  Dell PowerEdge R730, 2 sockets, BIOS 2.19.0 (also reproduced on 2.11.0),
  iDRAC8 2.75. On-board: 82599 (8086:10fb) on CPU root port 00:03.0,
  PERC H730P Mini (1000:005d) on 00:01.0, I350 (8086:1521) on PCH root port
  00:1c.4. BIOS: X2APIC, I/OAT and SR-IOV Global disabled unless stated.

Bisection (v6.14 good, v6.17 bad; test kernels booted from RAM via PXE, a
BAD boot detected through the BMC's SEL):
  first bad commit: 96336ec70264 ("PCI: Perform reset_resource() and build
  fail list in sync")
  96336ec70264 does not build on its own (pci_resource_is_disabled_rom() is
  not defined anywhere); it was tested with a one-line definition matching
  the check it replaced. Its parent e89df6d2beae boots.

Mechanism (from serial console logs with PCI dynamic debug):
  - The firmware leaves the 82599 VF BARs unassigned, so pci_realloc_detect=
()
    enables reallocation.
  - On the first pass the disabled ROM BARs of 02:00.0, 01:00.1 and 07:00.1
    fail ("can't assign; no space").
  - Before 96336ec70264 a failed disabled ROM BAR was not added to fail_hea=
d.
    96336ec70264 tests that with an idx that is not set for the resource
    being checked, and 2499f5348431 ("PCI: Rework optional resource
    handling") removed the test, so the ROM BARs land on fail_head.
  - "PCI: No. 2 try to assign unassigned res" follows: the windows of
    00:1c.4, 00:03.0 and 00:01.0 are released and reassigned; the I350 move=
s
    from 0x91a80000 (firmware) to 0x92200000.
  - The last console line before the reset is igb saving the config space
    of 07:00.0 with BAR0 =3D 0x92200000.
  The new address range is free in /proc/iomem; why the platform resets is
  not known.

BIOS switch matrix with stock v6.17:
  all three disabled                     -> resets
  SR-IOV Global only                     -> boots (no realloc, no 2nd round=
)
  X2APIC + I/OAT, SR-IOV Global disabled -> resets
  any switches, pci=3Drealloc=3Doff          -> boots (tested with all disa=
bled)

Current mainline v7.4-rc2 still resets. A patch restoring the old behavior
(do not put a failed disabled ROM BAR on fail_head) makes both v6.17 and
v7.4-rc2 boot; it follows on linux-pci.

Attachments:
  sol_v6.17-realloc-off.log       serial console, GOOD (pci=3Drealloc=3Doff=
), with
/proc/iomem
  sol_96336-bad-dbg.log           serial console, BAD, first bad commit, PC=
I
dyndbg
  sol_v7.4-rc2-dbg.log            serial console, BAD, mainline
  sol_v7.4-rc2+fix1.log           serial console, GOOD, mainline + patch
  sol_v6.17+fix1.log              serial console, GOOD, v6.17 + patch
  sol_v6.17-stock-sriov-only.log  serial console, GOOD, SR-IOV Global only
  git_bisect_log.txt              git bisect log
  lclog-excerpts.txt              iDRAC Lifecycle log entries for a failed =
boot
  harness.tar.gz                  test scripts (addresses replaced by
placeholders), kernel .config, initramfs
  lspci-vvv.txt                   from the working v6.8 kernel (BIOS switch=
es
enabled; with
                                  SR-IOV Global enabled the BIOS renumbers
buses, so the
                                  PERC is 03:00.0 and the I350 08:00.x ther=
e)

Notes: The analysis and patch were prepared with help from an AI coding
assistant (Claude, by Anthropic); all results above come from test boots on
the machine described.

--

#regzbot introduced: 96336ec70264
#regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=3D222253
