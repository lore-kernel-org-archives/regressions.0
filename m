Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4D036493A
	for <regressions@lists.linux.dev>; Sun, 23 Aug 2026 09:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787478963; cv=pass; b=XwXfYLf0JDVdp+4nWC+PJg9/AWYXk2ObdugRsL1g+MVF+DDY6fWQyPPXxFBYhTFoVytRU4O4aNAteqWTezhgS7NB3gIBXN80ECjx36j/LjizFUuT4XSz83LL8GMA4yV8w6WLhqheMV+7lACbH7KsFMcDcPljObk9f4zBB+EgMcw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787478963; c=relaxed/simple;
	bh=Nw74la8wgtHJmZcuHFXYMTg8iPzT/6DbNZCXgT2YXgU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=R7tAe3dLsFgtXQJt2Y7KNgxqhCtWE3yCiRVBP6IZllc7w9C1zVoWD8TG6yhdpy66XMD3xLgq5TbFwAvral48fsE6HGhVzaBvjRBwtmH3veTxUCTJEMNaQ5CW5DAvRaOmre/e/bwLGZmTOnhfbEyHWyvn07r1kUXgwtBA4U2icLk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E7cKL+oQ; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E7cKL+oQ"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b015b2d792so2479829e87.3
        for <regressions@lists.linux.dev>; Sun, 23 Aug 2026 02:55:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787478956; cv=none;
        d=google.com; s=arc-20260327;
        b=l3PSi72h5tEyMCjrD8t4YPyGzgkxQ5HDsYvpZwERgnCh3BtPO0bUIpWo/FVh2YbYX1
         ITGJazIiWhRWkk35L4aZ9Ac9waCQYZLVmFhLKajq8yGdZDoHMlwLmyjXBe1nJNQMhSZF
         MiUpZrrYq80C7yCdDmDPnsRP2Opvyd4fL84IMovW6By09bZxcPosyB0ayb2jWwQ3sN2F
         +2oJucvw4Omeak6FuMet7sWbeTUx8wiKxYzzipsLLlRIzIIcIgMEAgPfiUSIcp1eHzON
         30Ok0GujyWndYG9bw6oJ4PaHh1mxZZMNxendAyyckRpK1fLajTMQDmsFTkl7dZCdxdJf
         qo5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=FlTbrrUggaqMyw+bgqwhmY78qq8sF81Rm+Hrcy3EG6g=;
        fh=JzSXC2OYptcOh6efAqdhEX40pBXKVlE3tIQidxgPmYg=;
        b=dP3dHVATpavlhCBqjxu8n+TX6MOrV08jqFtw+FwlkVWPxfDFCnA6p10O+tYH3P5GkO
         VXM5H/JRyxcTEfPaDvu1bASV6RR9dDazC9dIV5g1juH/qTtcBAC/Asrho1KcxYvikli+
         s3ta1PvzPWFVWfQ3wDebeUvnixYIUMgV+rVRVFOQLE3bp3JFoQz82hmY+UVG1llppbRk
         zbqYbdQ5A14UKFDpObOkao4NUTLWirx2NOYV3e1Q53oi20664FD+G/+Nwa6qLN8lXQJU
         8BUWAWC6zS0mVIUf2HfY0pm8tBmSjJ7JQZJo6gwzC73YBCrkGcKwA9iLVKdpfbvCPpA1
         nigQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787478956; x=1788083756; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FlTbrrUggaqMyw+bgqwhmY78qq8sF81Rm+Hrcy3EG6g=;
        b=E7cKL+oQi1remuGCZdIaQaxKGkJmDWMpG6qYcJrNULkOFCWrgm3n7/Fm0NxUm9gUwB
         OutbxFa0gtowtGbuXpsmRowrqEC0TFjVV5FVadwlIFbzINGvNgjaCb5Km8Rt3L6bM1N0
         m3xJbAoZZUEDyiYO74w06oS9j7g7mfnXWkPHX2zzmTG7wm2eiiwy+rUihqvUq2dUQM1F
         RK+jos+YQmMKViGan80MAbUPXAYgwsdUl1ovzw+vrdgK2+AbuSCp/B6eDpkr/wGSCDm5
         IUaqgCOB9emT5WVz35HkMYxkv49CWvJDGtOn4qj+CTv7gxmCSO1CwjJwqMNSO9/7IHSr
         7ksA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787478956; x=1788083756;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FlTbrrUggaqMyw+bgqwhmY78qq8sF81Rm+Hrcy3EG6g=;
        b=J2Hh++0Bsa5qSFy6VTjI0GbHsNejR2UQVSxbdCot73rZOiA2AxfSsfyyp8QgC6BnZT
         c/F6iMmyoxPXmApwKDo+IhTS1NaW4M/4jiu01QaSmGEO6igbsj5X2bUrqarEaMN7kbfG
         9ARJZ5eyNFgz39jiiQ1zHeGmrC3E5BM2A7D+hRrz6+4+BI3LJh2+yWxUpwIx6ywH2nSV
         lLymYUT/6fQoKLOszHtTu+YrVyYuZxQglW9o0U2pkz830IRUKQ6FDXxMsj6u3vl6QShf
         NTLNRoAYpi6rhsg6Ov7iFtN0FLFB8D6KfoT8lWgr8SQDdEOSK0au/ZCJctRn1R5aBBd1
         5gcw==
X-Forwarded-Encrypted: i=1; AHgh+RpAhVa0sxZgJFCHNI+RwqeQXh6/SfEijbuFjkH0hCCU1hsAcAKItbZ0kM3ajZ6swj8tpz/65I3B3Lqrew==@lists.linux.dev
X-Gm-Message-State: AFuF++mLzGmOhbFxOxmhCkSpEsNXS+sezFpgPfFFYGrsTJNQbyFnAibV
	0RSJ77src3ILFdq9DtKU4kBmxZaa6e7jXRCJt0nN+U4Kx/CSRoBBzU/y0DNeldrcwKHzSo5TxMz
	pq+42tVRHECM3TCF9tupwGU5gEt1XFqE=
X-Gm-Gg: AR+sD12oQls3lhsztMcOWG/zOFi5kSh16XLqSuSBbxY8lsOZI8LQ9iAiAy5k4tqIxKN
	7SEMrUv7AVCxoag/WhdCYRmJryRg7FVjUQwTJ87Mc71m8fuKJTtCKrekPqO4dFSjbLDxPyeOYKN
	YZvkSgUOsZzXhX4fhmwDjgqkKf4PkGGYi6QuHP3/zt4nV0Eb3d6eBCH4REZC7+Y9LrtY2GA/TM1
	UzO2Arpyn2rte/+p5XUZ/tY3jkCzIFIOQJcBjuJ2nvIQyWmlo7m516WBpyjXPmfnFpOxo56MEYG
	DQQQbllR2sowUtI5X0IseX/6RFqoWGHRrOQwxPwrHST1Uj1af34uhBNSqad/kT3JxPhr+YNBNJV
	LtOlJDhRSZvs=
X-Received: by 2002:a2e:bc24:0:b0:39c:7ae9:daa4 with SMTP id
 38308e7fff4ca-3a1aebfa043mr45890701fa.6.1787478956256; Sun, 23 Aug 2026
 02:55:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Mathieu Fluhr <mathieu.fluhr@gmail.com>
Date: Sun, 23 Aug 2026 11:55:44 +0200
X-Gm-Features: AcwNN1WG1zr6pt-Fj0EIx9LKjxg42unheW4r6mklpNWhf3diH2GqnZH4wrwOwE4
Message-ID: <CAPyJwA_D9qw0T72f8zwM1yKjP+To=maVANbcdsWM7yRmbBxYvw@mail.gmail.com>
Subject: 
To: mathias.nyman@linux.intel.com
Cc: stern@rowland.harvard.edu, gregkh@linuxfoundation.org, 
	linux-usb@vger.kernel.org, regressions@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi all,

I'm reporting a regression that causes a hard platform reset on my workstation,
But, before digging into the technical details, I would like to first re-trace
how I came to this particular commit.

As an AOSP developer I am compiling daily different versions of AOSP on it,
mostly building an Android (Automotive) emulator for quick "code-build-test"
runs. I use Ubuntu 24.04 LTS for that, updating to the latest HWE kernels that
Ubuntu provide there (6.8, 6.11, 6.14 etc. until 7.0 recently), with no manual
modifications applied.

3 weeks ago, I needed to analyze and issue happening inside Android 11,
building an emulator for a simple Android phone [1]. But when I started using
this emulator, first with the latest 7.0 kernel I noticed several hard crashes,
sometimes just freezing my workstation (with fans full on, but sometimes fans
full off), but also sometimes automatically rebooting it.

After a few days of deep investigations (To be honest, I first suspected an
issue with the nivida driver), I found out that a pattern to reproduce this
quickly was to let the computer idle with the emulator running. The crash was
always occurring under 20/25 minutes, most of the time letting it idle for less
than 10 was even sufficient.

This made me a bit curious, and looking a bit deeper (and with a little help
of AI) I was able to find a workaround. forbidding my CPU to enter C2 state,
using "processor.max_cstate=1" argument. Using this, I was not able to
reproduce the crash for more than an hour, but I did not pursue there very
much: As a developer I hate workarounds :)

I instead started to get "back in time" on a clean and up-to-date fresh Ubuntu
24.04 install, reverting back to "good old" kernel versions, since I could not
convince myself that first my CPU was dying and second that the issue has always
been there. I confirmed that 6.8 and 6.11 (again Ubuntu HWE packages) work
fine, but the crash was reproducible using 6.14 and above.

I then got my hands dirty, and started to test different mainline kernel
prebuilt packages up to a point where I confirmed that 6.12.35 worked fine, but
6.12.40 not. I then bisected both versions, ensuring a good case meant the
emulator was idling without any crash for 1 hour minimum. This lead at the end
to the following commit:

  aec11e5f9c452ef64e2c113637ab89a67a5ceb62
  ("usb: hub: fix detection of high tier USB3 devices behind suspended hubs")
  [mainline: 8f5b7e2bec1c36578fdaa74a6951833541103e27]

Being quite astonished that something related to C2 state was triggered by an
USB patch, I then tested the latest 7.0 kernel, this time using the
"usbcore.autosuspend=-1" argument instead. To my surprise, I could not
reproduce the crash, even with the exact same emulator idling for 2 hours.

Also, something very astonishing, that I still cannot fully understand today:
 1. "priming" my system with a 30 seconds (!) run of a modern Android
     emulator [2] cleared the issue: After closing the 15 emulator and starting
     the 11, I could let it idle for again more than an hour. It seems even not
     be related to the 'kvm' kernel modules, since removing the module and
     re-inserting it between both emulator did not change a thing.
 2. A few times (I did not really invest debugging this TBH), the crash even
    occurred shortly (2-3 minutes) after I closed the Android 11 emulator.

Now, the technical details of my setup...

Hardware / software
===================

CPU:        AMD Ryzen Threadripper 7970X (Storm Peak, family 19h)
Microcode:  0x0a10810c
Board:      ASUS Pro WS TRX50-SAGE WIFI, BIOS 1203 and 1317 (both affected)
Memory:     128 GB DDR5 ECC RDIMM @ 4800 MT/s (JEDEC, no XMP/EXPO)
GPU:        NVIDIA RTX 3080 Ti (also reproduced with RTX 5080)
Distro:     Ubuntu 24.04 and 26.04 with 595-open NVIDIA driver
USB:        8 onboard xHCI controllers; only a USB keyboard and mouse
            attached

Error signature
===============

On the boot following each crash I could always see the following lines in
the dmesg logs:
---8<-------------------------------------------------------------------------
  x86/amd: Previous system reset reason [0x88000800]: an uncorrected
           error caused a data fabric sync flood event
  x86/amd: Previous system reset reason [0x88000800]: a software sync
           flood event occurred
---8<-------------------------------------------------------------------------

When I was fortunate enough and had an automatic reboot, this was also inside:
---8<-------------------------------------------------------------------------
  [Hardware Error]: event severity: fatal
  [Hardware Error]:   section_type: IA32/X64 processor error
  [Hardware Error]:    Error Structure Type: cache error
  [Hardware Error]:    Check Information: 0x000000000602001f
  [Hardware Error]:     Transaction Type: 2, Generic
  [Hardware Error]:     Level: 0
  [Hardware Error]:     Processor Context Corrupt: true
  [Hardware Error]:     Uncorrected: true
  mce: [Hardware Error]: CPU 34: Machine Check: 0 Bank 5: aea0000000000108
  mce: [Hardware Error]: TSC 0 ADDR 1ffffff98e8ee38 MISC d0150fff00000000
       SYND 4d000000 IPID 500b020049b00
---8<-------------------------------------------------------------------------

The signature is bit-identical across every occurrence except for the
reporting CPU, which varies (observed on CPUs 1, 3, 7, 16, 32, 34, 35).


Reproducer
==========

1. Boot an affected kernel with default idle settings (C2 available,
   no max_cstate restriction).
2. Start an old and/or 32/64-bit Android emulator (QEMU/KVM guest) and leave it
   idle on the launcher screen. Nothing else running.
3. System hard-resets within 20 minutes.

Under sustained CPU load the fault never occurs; it requires the system to be
idle. turbostat confirms ~99% C2 residency across all cores in the crashing
condition.


Bisection
=========

---8<-------------------------------------------------------------------------
git bisect start
# status: waiting for both good and bad commits
# good: [783cd2c3dca8b6c434e955b84c20c8940588dc68] Linux 6.12.35
git bisect good 783cd2c3dca8b6c434e955b84c20c8940588dc68
# status: waiting for bad commit, 1 good commit known
# bad: [d90ecb2b1308b3e362ec4c21ff7cf0a051b445df] Linux 6.12.40
git bisect bad d90ecb2b1308b3e362ec4c21ff7cf0a051b445df
# good: [3ce57d493dd81ecc27033c7a918cc0d0ddaa8edc] ata: libata-acpi:
Do not assume 40 wire cable if no devices are enabled
git bisect good 3ce57d493dd81ecc27033c7a918cc0d0ddaa8edc
# good: [bbd385b65f9e56cab1243e753510a99a59110083] net/mlx5e: Add new
prio for promiscuous mode
git bisect good bbd385b65f9e56cab1243e753510a99a59110083
# good: [2a76bc2b24ed889a689fb1c9015307bf16aafb5b] smb: client: fix
use-after-free in crypt_message when using async crypto
git bisect good 2a76bc2b24ed889a689fb1c9015307bf16aafb5b
# good: [95a13b0a6b042ac5333b67f59af1dffe7b71137b] riscv:
traps_misaligned: properly sign extend value in misaligned load
handler
git bisect good 95a13b0a6b042ac5333b67f59af1dffe7b71137b
# good: [40b5b4ba8ed87c0bfb6268c10589777652ebde4c] drm/mediatek: Add
wait_event_timeout when disabling plane
git bisect good 40b5b4ba8ed87c0bfb6268c10589777652ebde4c
# bad: [affb46db59f908474a211f23953c3b9109f0d647] net: libwx: fix
multicast packets received count
git bisect bad affb46db59f908474a211f23953c3b9109f0d647
# good: [ee56da95f8962b86fec4ef93f866e64c8d025a58] btrfs: fix block
group refcount race in btrfs_create_pending_block_groups()
git bisect good ee56da95f8962b86fec4ef93f866e64c8d025a58
# bad: [bf71baa3cfe754c6e99ad62711b9fb3e3da33517] usb: hub: Fix
flushing of delayed work used for post resume purposes
git bisect bad bf71baa3cfe754c6e99ad62711b9fb3e3da33517
# bad: [e11359640090ab26e4153cce583f50e0b8979f0d] usb: hub: Fix
flushing and scheduling of delayed work that tunes runtime pm
git bisect bad e11359640090ab26e4153cce583f50e0b8979f0d
# bad: [aec11e5f9c452ef64e2c113637ab89a67a5ceb62] usb: hub: fix
detection of high tier USB3 devices behind suspended hubs
git bisect bad aec11e5f9c452ef64e2c113637ab89a67a5ceb62
# first bad commit: [aec11e5f9c452ef64e2c113637ab89a67a5ceb62] usb:
hub: fix detection of high tier USB3 devices behind suspended hubs
---8<-------------------------------------------------------------------------

(Please note that I did not perform a full "revert test", since the aec11e5f9c45
commit could not be cleanly reverted on both 6.12.40 and 7.0.0)


Workarounds
===========

Either of these prevents the crash on an affected kernel:
  usbcore.autosuspend=-1     (disables USB runtime PM)
  processor.max_cstate=1     (prevents C2 entry)


Ruled out
=========

- GPU/driver: reproduced with RTX 5080 (595-open module) and RTX 3080 Ti
              (both 595-open and 595 proprietary modules)
- ASUS USB4 PCIe add-in card: reproduces in ~5 min with the card physically
                              removed
- AVIC: kvm_amd avic=N on both good and bad kernels
- TSA mitigation: tsa=off verified applied
  (/sys/devices/system/cpu/vulnerabilities/tsa = "Vulnerable"), still crashes
- Memory: stock JEDEC 4800, no XMP/EXPO, no ECC errors logged
  (ras-mc-ctl reports zero CE/UE)
- Thermal/power: ~47-50 C at time of crash, system idle; 1600W Seasonic PSU
- Hardware health: multi-hour AOSP compiles (all 64 threads, heavy cache
  load) and repeated GPU stress runs complete without error


I hope this gives you enough details to start looking at what could cause this
weird behavior. Just FYI, when asked about hardware damage, AI suggested more
something like "a CPU-level microcode erratum in the deep-idle path on this
platform", but being old-school, I tend to always triple-check what AI tells
before claiming it myself :)

Thanks and Kind Regards,
Mathieu

------
[1] using android-11.0.0_r46 release tag and "sdk_phone_x86_64" as lunch target
[3] using android-15.0.0_r32 release tag and "sdk_phone64_x86_64" as lunch
    target this time, since Google only releases 64-bit only today
