Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29925239E7E
	for <regressions@lists.linux.dev>; Fri, 29 May 2026 16:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780071346; cv=none; b=IPsLZzNkIc/9a4uQKW9VDizWTdOZRrNbBBjz4cWYcDavwJVLnmzJBHH98QW1udCu9SIAKy8sO2P2fMEo4gRTany6QPKmcvb4+P76Zw7YnKkCJD6drS0sBF5FxpVl9ZPRhmTSoDIqZvNDbYNMDzgF7tC70O1ZfpHXK7AnAsfZhyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780071346; c=relaxed/simple;
	bh=uLoFhemdE9sxJb5bs7yz2anKljzcJfuwrkqyVVkeQi4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=WeobhDEhsMCpPu4uw0jhjMG+Qy4gKJA7J+mEzBB4L+cNXycYCzM+oCiDsXlLfxux3O8S0V6nsvO2cAKP3GH+tNFWkOJBMSsORKelp/motr4Nd6+T/Wp2ovikxu4OlJd5QPD54b/Iq1Q1DiJ0t/NjzzeAQHuvxy70v/U+uMVuNJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=G4GXk5lr; arc=none smtp.client-ip=188.68.63.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="G4GXk5lr"
Received: from mors-relay-8201.netcup.net (localhost [127.0.0.1])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4gRp9h2qm4z3p8L;
	Fri, 29 May 2026 18:05:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1780070744;
	bh=uLoFhemdE9sxJb5bs7yz2anKljzcJfuwrkqyVVkeQi4=;
	h=Date:Subject:To:References:From:Cc:In-Reply-To:From;
	b=G4GXk5lr4alfXFCl3u39l6NIGN0fWX+9hwxG1U9gImn35IiaYGn6s6xQgCV1BxlTC
	 gHN4y7WDT3EsG8Nep/NzaiURRrnAhWl0sATsDQba7t44imMyrmQDX7Ik2ONT3Mal0f
	 bafJd1/m1OstfXfrBtdvVDJ3OJBClHVRJfpUW7e9fR1EWwT1ybp5nv/yG1hK0KKmme
	 dxCr8+VBHvSY7hCF3+GcDXW/5i1Bn3UmJ3T7elEHzUdw9kgLaArnWWVFFUtu8yzzL3
	 44uXNzFXVW6H9HKr6JzOVZ53A+ZbPRmZtZAuUoYa11VrlcNK88DDAjheQjwvZnCJjB
	 RaEz9YBYCg0Jw==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4gRp923sbKz3wKM;
	Fri, 29 May 2026 18:05:10 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4gRp916QmFz8sZP;
	Fri, 29 May 2026 18:05:09 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 0AB0B6179C;
	Fri, 29 May 2026 18:05:09 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <3b4e5f3c-4b55-4c28-a018-e306bf8a807d@leemhuis.info>
Date: Fri, 29 May 2026 18:05:07 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: regressions report as of Linux 7.1-rc5 post (was: Linux 7.1-rc5)
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: 
 <CAHk-=wjt1NiKOdyAMz_DT7NmZ++SizPOhRSi492ukdTnpDzHQw@mail.gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
X-Enigmail-Draft-Status: N11222
Autocrypt: addr=linux@leemhuis.info; keydata=
 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 MEK4
Cc: Linux kernel regressions list <regressions@lists.linux.dev>
In-Reply-To: 
 <CAHk-=wjt1NiKOdyAMz_DT7NmZ++SizPOhRSi492ukdTnpDzHQw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <178007070947.284924.9260792749029725062@mxe9fb.netcup.net>
X-NC-CID: sytg+xQjuk75wRH1s+6I5m0hPcETeu6gOq58ySYBttNnWUiC7sg=

Hi Linus!

On 5/24/26 23:07, Linus Torvalds wrote:
>
> So I think I'll start being a bit more hardnosed about this kind of
> unnecessary churn this late in the game. We are supposed to look for
> *regressions*. Non-critical fixes to long-standing issues are simply
> not appropriate for this late in the release cycle.

Speaking of regressions: I got the feeling the weekly regression reports
made way more work then they were worth it up to -rc5. But we are
approaching -rc6, so let me give you an overview about some unresolved
regressions.


###########################################################################
Unresolved regressions from this cycle that could easily get fixed for
-rc6 -- but might or might not:

---
media: renesas: vsp1: brx: configuration of the DRM pipeline broken
https://lore.kernel.org/linux-media/CA%2BV-a8t481xuwava0nb7uY9CUPqFWZ_8EP0xrK3BgumP7HDcLg@mail.gmail.com/

Known for 6 weeks. A patch-series to fix this with reverts is sitting on
the list for three weeks now. Prodded there Wednesday, but maintainers
did not yet pick things up. Laurent sent a PR on Friday to get them to
act, maybe that will do the trick:
https://lore.kernel.org/linux-media/20260529102955.GA675012@killaraus.ideasonboard.com/

---
drm/i915: backlight problems
https://lore.kernel.org/lkml/CADo9pHjr-zZ9C3%2B026y5%2BXOGPSeRzSJMCHof27TVPtAUNgTc8A@mail.gmail.com/
aka https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16015
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16043
https://lore.kernel.org/lkml/d2de7933-e650-4b19-8d88-90d66693dcfc@message-id.googlemail.com/
aka https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16097

Known since -rc1 and fixed by a revert that sits in -next as
f30fddb4402313 ("Revert "drm/i915/backlight: Remove
try_vesa_interface"") [next-20260520] -- looks a bit like it's destined
to be merged in the next merge window, but with all those cherry-picking
in the drm subsystem I might easily be wrong. Asked for the plans on
Thursday, no reply yet:
https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16043#note_3492668

---
soc: imx8m: warning and serial id data missing
https://lore.kernel.org/lkml/6593091.DvuYhMxLoT@steina-w/

Known for 9 weeks. The fix was sitting on the list and in next
(2c6821657ce3b3 ("soc: imx8m: Fix match data lookup for soc device"))
for a while; I prodded on Thursday and it's supposed to be en route to
mainline now.


###########################################################################
Unresolved regressions from this cycle that are unlikely to get fixed
for -rc6:

---
drm: amdgpu: handling FreeSync via MCCS broke VRR
https://gitlab.freedesktop.org/drm/amd/-/issues/5286

Known for 17 days and reporter proposed a fix shortly afterwards; I
prodded the maintainers on Thursday and they want to look into things
and get something into next weeks -fixes pull:
https://lore.kernel.org/amd-gfx/20260518154809.660061-1-michel@daenzer.net/
https://lore.kernel.org/amd-gfx/BL1PR12MB51447AB016BB28843BAD0216F7092@BL1PR12MB5144.namprd12.prod.outlook.com/

---
cpufreq/amd-pstate: switching to performance profile broke
https://bugzilla.kernel.org/show_bug.cgi?id=221505

Known for 18 days, culprit unknown. Mario and colleagues fixed a few
bugs in this area in the past few weeks, but seems one problem that
affects at least two people on Asus laptops remains -- a fix or a revert
to resolve this is sadly not in sight
(https://bugzilla.kernel.org/show_bug.cgi?id=221505#c22).

---
loop: loop drive broken due to some race exposed by an unknown change
https://lore.kernel.org/lkml/69e2ca14.a00a0220.1bd0ca.0031.GAE@google.com/

Known since 6 weeks. People are busy trying to get this resolved.


#########################################################################
Unresolved regressions from the previous cycle that could easily get
fixed for -rc6 -- but might or might not:

---
ARM: at91: finding rootfs on raw nand on sam9x60 broken
https://lore.kernel.org/lkml/20260423-stoke-ocean-139dbe306256@thorsis.com/

Known for 5 weeks. Fix was sitting in -next as 754d60ad1c9189 ("memory:
atmel-ebi: Allow deferred probing") since next-20260504; prodded on
Thursday, now en route to mainline.

---
drm/amd/display: screen goes black halfway through the booting proces
https://gitlab.freedesktop.org/drm/amd/-/issues/5272

Known for 19 days. Hope the fix will make it to mainline soon:
08236c3ef284cd ("drm/amd/display: Write REFCLK to 48MHz on DCN21")
[next-20260528]

---
serial: 8250: BREAK + SysRq dispatch broken
https://lore.kernel.org/lkml/5efe9e03-4d86-43a0-9ec2-e610ff31095d@free.fr/

Known for 17 days. Hope the fix will make it to mainline soon:
71f42b2149a130 ("serial: 8250: dispatch SysRq character in
serial8250_handle_irq()") [next-20260525 (pending-fixes)]

---
accel/amdxdna: AMD PMC causes hard hang on s2idle suspend
https://gitlab.freedesktop.org/drm/amd/-/issues/5319

Known for 10 days. Hope the fix will make it to mainline soon:
a8878e19d2f520 ("accel/amdxdna: Block running when IOMMU is off")
[next-20260522 (pending-fixes)]

---
ipv6: SSH session gets dropped, usually several times, in the first hour
or so https://lore.kernel.org/all/20260521135310.GC977@cmadams.net/

Known for 8 days. Revert under lively discussion, see thread above and:
https://lore.kernel.org/all/20260529112357.5079-1-fmancera@suse.de/
https://lore.kernel.org/all/20260528111123.4667-1-fmancera@suse.de/


#########################################################################
Unresolved regressions from even earlier cycles that could easily get
fixed for -rc6, but that's unlikely to happen from what I see:

---
e1000e: "Unstable ethernet connection on Dell Pro 16" as well as "PC10
in runtime idle in newer systems prevented"
https://lore.kernel.org/all/20260417104330.3031987-1-dima.ruinskiy@intel.com/
https://lists.osuosl.org/pipermail/intel-wired-lan/Week-of-Mon-20250623/048860.html

Known for 5 months, and a fix exists, but Intel claims it needs more time:
https://lore.kernel.org/all/20260417104330.3031987-1-dima.ruinskiy@intel.com/
https://lore.kernel.org/all/56f5f3da-31b8-4847-b274-ce140bf39617@intel.com/

---
scsi: massive resource usage that can lead to kernel crashes
https://lore.kernel.org/lkml/773ba972-433b-44b4-89d2-295bd9f5de38@huawei.com/
https://lore.kernel.org/linux-scsi/20260415204850.799431-1-mwilck@suse.com/

Known for 9 weeks. Fixes exists for weeks, but discussion is slow. hch
recently ACKed it:
https://lore.kernel.org/linux-scsi/20260513174236.430465-1-mwilck@suse.com/

---
rtl8xxxu: RTL8188FTV (0bda:f179) fails to authenticate/configure since 6.19
https://bugzilla.kernel.org/show_bug.cgi?id=221394
https://lore.kernel.org/linux-wireless/8a4c664f-231f-437e-b010-b741c7ed7be8@leemhuis.info/

Known for 6 weeks. A fix is sitting in a sub-sub-subsystem tree for a
while now that is not even in -next -- and it looks like the developers
are unwilling to merge the fix this cycle:
https://lore.kernel.org/linux-wireless/c57de68e-5d57-4c26-898f-8a284bb25381@gmail.com/

---
x86/fpu: applications that construct signal frames in userspace broke
(such as CRIU and gVisor)
https://lore.kernel.org/lkml/20260429000623.3356606-1-avagin@google.com/

Known for 4 weeks. A revert was proposed a month ago (see above), but
didn't make any progress; a newer revert was posted this week:
https://lore.kernel.org/lkml/20260526205047.3339490-2-avagin@google.com/

---
NFSv4: mkdir(2) on an NFSv4 mount occasional returns -EEXIST
https://lore.kernel.org/lkml/20260429104938.1776671-1-igor.raits@gmail.com/

Known for 4 weeks. A fix exists, but maintainers didn't reply yet and
recent prodding by yours truly did not help:
https://lore.kernel.org/lkml/20260429104938.1776671-1-igor.raits@gmail.com/


#########################################################################
Unresolved regressions from even earlier cycles that could easily get
fixed for -rc6 -- but might or might not:

---
parport: race leading to a NULL pointer dereference and a panic
https://lore.kernel.org/lkml/6ba903ad-9897-42bb-8c2d-337385cc3746@molgen.mpg.de/
https://bugzilla.kernel.org/show_bug.cgi?id=221526

Known for 6 months now. Culprit is very old, but seems the problem
somehow happens more often since some time ago. Hope the fix will make
it to mainline soon: ef15ccbb3e8640 ("parport: Fix race between port and
client registration") [next-20260525 (pending-fixes)]

---
usb: typec: ucsi: laptop does not enter suspend anymore
https://lore.kernel.org/lkml/agvqqMt9x0df-WXS@google.com/

Known for 10 days. Hope the fix will make it to mainline soon:
d98d413ca65d07 ("usb: typec: ucsi: Don't update power_supply on power
role change if not connected")

