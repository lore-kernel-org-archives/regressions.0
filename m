Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.154.255.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794252857;
	b=RreZOwt+c3S1mh+QIOdu58EOmd0agETYjzxX6DFzsviinK+b4MjLPM+j2u8AhmzLgMHT
	 2PduVil3gUy/GE9wtx7OmDY5toIbLd89rHlWss6QpBxJN8IBRLy9nHvozLXgp9NmcEVHY
	 ENXTwwQSNCA4+qTXAA84jX86r46264kJ2weQCgx5HdYYvEoaquj4NkZCX16Ta/h6Z0ZIl
	 j6gwWzpBYnYCWR+O4fmFY4d3BgQXu0FJRDYHYMG1Uig8bBZ9Qo1/xnDZUrNgAviwhoSKN
	 54mgfSRgQIvj4iafCJO6VZCAQ+FQ6op+VwpOTFetn3Ibtr9WRzlRxZ61XCSFqgG40ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794252857;
	h=DMARC-Filter:X-KumoRef:DKIM-Signature:DKIM-Signature:Received:
	 DKIM-Signature:From:Subject:Date:MIME-Version:Content-Type:
	 X-CSA-Complaints:X-Maileroo-Ref-Id:To:Message-ID:
	 Content-Transfer-Encoding:Feedback-ID:X-Tenant-Id;
	bh=+GjJ2slK0PGAyv1yIQM1jKzuh/MgUhbUiZsMzHVrrjE=;
	b=VoEHjOENPMmcyRsQlsgp8DBWQ4MVoy6V2ZxY+80cF67Lzr0B064InM8Pd5xAwcAWJf9h
	 X0IWDK5self0295D4CcDYQNuZVASCqmt5gngdZuFdZnymr24j7JkUCGyXaWq5dwVzMAdD
	 Gw48KANFxCoA/UorZdB9yQ/RQLdlYKCiTx80//+35OgSFIXf3nMRsRgpfAaFJGS5LIwgK
	 UIKRlSjPA36tKjocaJl5oB58d511jmjj+XkUQ/miDRt+31hfK9iFNBkefXMDGXIkOjPX9
	 4lZRhlZZK8RafhrsImeZJmwYOt1QeTf90ASCI2dIsCnxkvWS9VbvLk15hPySvhd0n/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=darioackermann.ch;
	spf=pass smtp.mailfrom=darioackermann.ch;
	dkim=pass header.d=maileroo.info header.i=@maileroo.info header.a=rsa-sha256 header.s=mta header.b=fdDnX5e3;
	dkim=pass header.d=darioackermann.ch header.i=@darioackermann.ch header.a=rsa-sha256 header.s=mta header.b=CLMiRNDO;
	dkim=fail reason="signature verification failed" header.d=darioackermann.ch header.i=@darioackermann.ch header.a=rsa-sha256 header.s=v1-rsa-20261020 header.b="Lu3x8rp/";
	arc=none smtp.remote-ip=213.154.255.216
Received: from mta171.maileroo.com (mta171.maileroo.com [213.154.255.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6E6606A31C
	for <regressions@lists.linux.dev>; Mon,  9 Nov 2026 19:34:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A6E6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=darioackermann.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darioackermann.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=maileroo.info header.i=@maileroo.info header.a=rsa-sha256 header.s=mta header.b=fdDnX5e3;
	dkim=pass (2048-bit key) header.d=darioackermann.ch header.i=@darioackermann.ch header.a=rsa-sha256 header.s=mta header.b=CLMiRNDO;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=darioackermann.ch header.i=@darioackermann.ch header.a=rsa-sha256 header.s=v1-rsa-20261020 header.b=Lu3x8rp/
X-KumoRef: eyJfQF8iOiJcXF8vIiwicmVjaXBpZW50IjoicmVncmVzc2lvbnNAbGlzdHMubGludXguZGV2In0=
DKIM-Signature: v=1; a=rsa-sha256; d=maileroo.info; s=mta; c=relaxed/relaxed;
	bh=+GjJ2slK0PGAyv1yIQM1jKzuh/MgUhbUiZsMzHVrrjE=;
	h=from:sender:reply-to:subject:date:message-id:to:cc:mime-version:
		content-type:content-transfer-encoding:content-id:content-description:
		resent-date:resent-from:resent-sender:resent-to:resent-cc:
		resent-message-id:in-reply-to:references:list-id:list-help:
		list-unsubscribe:list-subscribe:list-post:list-owner:list-archive:
		list-unsubscribe-post:feedback-id:x-csa-complaints; t=1794252850;
	b=fdDnX5e3v+Vjz/m7Sw6nexA7vR4Sffz8lnqU0fB77+mSExjwu0LAlY4SgniHeT+1mK38y2TMC
	TjDOh10k+pEHqm5+iZUCxwau6c3WU2dTKagT/MJjgbS0x+a+EeHT0Aa0+BYerNw3KkRInft1eYt
	jpcrfwFhwRdRvygrq5Nh1UP6AiCMCsJFx+ojz3wi09yJZl/hkYhZDz5BNzWm4j7qLh3B3brnPIo
	XXAcJHchFxJ/AF1TDs4LxUpSR/GhusOzWucHZtcKrodpn7wcsxGyY0eCmv1HtWfSdHVI0pYLirk
	PW8Tl8RMyhm4vbX1iWGLZqrPOwpz/B51GKYlf0tLWQVg==;
DKIM-Signature: v=1; a=rsa-sha256; d=darioackermann.ch; s=mta; c=relaxed/relaxed;
	bh=+GjJ2slK0PGAyv1yIQM1jKzuh/MgUhbUiZsMzHVrrjE=;
	h=from:sender:reply-to:subject:date:message-id:to:cc:mime-version:
		content-type:content-transfer-encoding:content-id:content-description:
		resent-date:resent-from:resent-sender:resent-to:resent-cc:
		resent-message-id:in-reply-to:references:list-id:list-help:
		list-unsubscribe:list-subscribe:list-post:list-owner:list-archive:
		list-unsubscribe-post:feedback-id:x-csa-complaints; t=1794252850;
	b=CLMiRNDONffDIG4veNQdVe000so0ttZot6p8u/xo08I5fO3GD/2rPOIwtPY30jsdXS+clgJWx
	oQ7mZ56PxYTfqWLSyckwkE9Cx6W1vTt2WhPcqWaKDLYSzYev5wfPZnpGgHy6E39plLM5YIKJoPU
	0P0g69y7TnoCsTKrinJS551XPgrXbDiE2flbmL2X+6S0RLTTHOXYkUjKoMCLhVA+KeLoBspYNAy
	ujVoeLbV7+/C+Ua6+g6UiWFatPf0ofz41lt9C4DjwbDdDTQ/2f51mmg0BrtT6gyqHKg1NIHdq3w
	ts4yXGymmcWyXK7cZeieuFalNzSwKDe7azfU9gVO8QZg==;
Received: from localhost (127.0.0.1)
  by mta6 (KumoMTA 127.0.0.1) 
  with ESMTP id 893c2627dc7411f1b4610200d472712f for <regressions@lists.linux.dev>;
  Mon, 9 Nov 2026 19:34:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=v1-rsa-20261020; d=darioackermann.ch; c=relaxed/relaxed; r=y; h=Date:Message-ID:Subject:To:From; t=1794252848; bh=+GjJ2slK0PGAyv1yIQM1jKz uh/MgUhbUiZsMzHVrrjE=; b=Lu3x8rp/dXwyjagPtSlG2B7nj4T2opYLcfPLBJaohqJxDGZm/a 900N2Bp1WzPbVK9+oc6AqngvoMeKZrw6rOjr7CnvpKxhrzB0/Ua0sbjdtZVO7NnnIbfijP36vPw XVUMMIGoMseQIh5GQd4GPtFCMB+oAA6qfkKhzPr+lZ6Oi0byYCGux3kVcz96SovRd6LlncyoaIj WAgt7DITc8HgpF8aqHS9CRlpGjN1hf744NUisYAvNMXGPqKSCcZ1rwzPO3LghlwqhBbgeg46Gcy XD2Gc0/4pcSLzrq4Loikh6+zMfKGJ9Jln3/10s04u7TlpSHrmgOZ9loBwmiry/qisIw==;
From: "Dario Ackermann" <dario@darioackermann.ch>
Subject: =?us-ascii?Q?[REGRESSION]_x86/microcode:_boot_hangs_bringing_up_f?= =?us-ascii?Q?irst_secondary_CPU_on_i7-6700HQ,_avoided_by_dis=5Fucode=5Fld?= =?us-ascii?Q?r?=
Date: Mon, 9 Nov 2026 19:33:43 +0000
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-CSA-Complaints: csa-complaints@eco.de
X-Maileroo-Ref-Id: 08ec7912e4c4d37035fc7013
To: <linux-kernel@vger.kernel.org>, <regressions@lists.linux.dev>
Message-ID: <581128204058725416570264.8152.2026119193410@darioackermann.ch>
Content-Transfer-Encoding: quoted-printable
Feedback-ID: u56201:maileroo
X-Tenant-Id: u56201

Hello

since moving beyond the Linux 6.1 LTS kernel, my ASUS N552VX laptop hangs d=
uring boot

while bringing up the first secondary CPU. Booting with dis_ucode_ldr avoid=
s the hang, so the problem appears to be in applying the microcode update t=
o secondary CPUs during boot.

Kernel versions (Manjaro kernels, vanilla not yet tested):

- 6.1.189-1-MANJARO: boots normally (rarely, ~1 in 10 boots, it showed a si=
milar black screen)
- 6.6 and 6.12: same hang (tested earlier, not re-tested in detail)
- 6.18.55-1-MANJARO: hangs reproducibly

The intel-ucode package (20260925-1) and the firmware are the same across t=
hese tests.

Symptom on 6.18: black screen, no journal entries from the failed boot.

With "loglevel=3D8 earlycon=3Defifb keep_bootcon" the output stops while br=
inging up the secondary CPUs. Last lines:

smp: Bring up secondary CPUs ...
smpboot: x86: Booting SMP configuration:

(the output ends after this and the system hangs)

Boot parameter tests on 6.18:

normal boot -> hang
maxcpus=3D2 -> hang
nosmt / noapic / intremap=3Doff -> hang
nomodeset / i915.modeset=3D0 -> hang
cpuhp.parallel=3D0 -> hang
acpi=3Doff -> boots (single CPU, ACPI hardware non-functional)
maxcpus=3D1 -> boots
dis_ucode_ldr -> boots, all CPUs online

After booting with maxcpus=3D1, onlining CPUs 1-7 at runtime via

/sys/devices/system/cpu/cpu*/online works, and all CPUs then report

microcode revision 0xf0. So the update itself applies fine at runtime;
only the boot-time bringup path hangs.

Hardware:

- ASUS N552VX, AMI UEFI firmware N552VX.304 (2019-05-08), no newer version =
available

- Intel Core i7-6700HQ (Skylake, family 6, model 0x5e, stepping 3), 4 cores=
 / 8 threads

- Microcode: 0xf0 loaded by the kernel; firmware-provided revision (dis_uco=
de_ldr boot): 0xc6

- 16 GiB DDR4, Intel HD 530 + NVIDIA GTX 950M

Full system details and the original discussion:

https://forum.manjaro.org/t/asus-n552vx-manjaro-linux-6-18-black-screen-unl=
ess-maxcpus-1/191095

I'm happy to test a vanilla kernel, bisect between 6.1 and 6.6, or try debu=
g patches.

#regzbot introduced: v6.1..v6.6

Thanks,

Dario Ackermann
