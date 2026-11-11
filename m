Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.241.220.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794390365;
	b=xx501Ad3wxGvNyL1R+kdFMDuV1WxV6jWC2s77KXrkLrZKfJimt+xgUyQhK7h6iWRH6sH
	 nW7bp2JJ9FxUCHbETyOlpijEnONAo7doY0xCa0vU/ZmQJjAk1nHvYhedL2GdogcJQvTqa
	 A48vRbr6OZbAjs2sfj7qLwklSWFX95UmTJRcwUBo7BcXNJRMEHkJIJ7s0mMxKWJt8ycjf
	 IiOPuRguZ8tD5V/vMjzAcirmU4QAt4l5GdNH+uiGb1gPvbhB9WK7DYP5NqMdRvf72/mlt
	 924f+SjeZJBROWSBIEY3xrIiOpcp6Ptdfk3oWTNmFtn9GjJx6VZQcsBLdyfRKHbz5Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794390365;
	h=DMARC-Filter:X-KumoRef:DKIM-Signature:DKIM-Signature:Received:From:
	 Date:Content-Transfer-Encoding:Cc:Subject:References:Content-Type:
	 Message-ID:Feedback-ID:X-Maileroo-Ref-Id:DKIM-Signature:To:
	 In-Reply-To:MIME-Version:X-CSA-Complaints:X-Tenant-Id;
	bh=NaNsA5eyMMzZsBJWrElEiCkH2y5OkN7uDpy6upCkkj0=;
	b=r5Co2dDlYFMXnF9XMyzFKfi2NODphR9oNG6xzDxv1ACK2/kIjoVn4SOUI31tMbCcmSDZ
	 JtQlvfpm0tDzL2Rch4/uDDixRCRP4ghJG78nLfZSF0If52WBCxcKNrX6D4uE1PlG2UztW
	 L2gdCxkKv1gkTaHOSUYTBCg4ylf75+x/9yh17eKUvILo3Di5bQji8rsxdXNA9YB8yHtzj
	 VjtSWcgBiuL5p+O7aM/n10+G6ROhGdaKPRWzkihhXL9hpuaEEO7qJqSIVIPxcRRKaghh/
	 irdYTmfgMUhw7u25Mns9wBiKtFV3pJ/5M+UxBsTa4uokKyenxr0a4fTc+HMPPXKyBLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=darioackermann.ch;
	spf=pass smtp.mailfrom=darioackermann.ch;
	dkim=pass header.d=maileroo.info header.i=@maileroo.info header.a=rsa-sha256 header.s=mta header.b="US3OZ6p/";
	dkim=pass header.d=darioackermann.ch header.i=@darioackermann.ch header.a=rsa-sha256 header.s=mta header.b="dwHHwbZ/";
	dkim=fail reason="signature verification failed" header.d=darioackermann.ch header.i=@darioackermann.ch header.a=rsa-sha256 header.s=v1-rsa-20261020 header.b="J/R1EKHL";
	arc=none smtp.remote-ip=188.241.220.22
Received: from mta194.maileroo.com (mta194.maileroo.com [188.241.220.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5D7606A31C
	for <regressions@lists.linux.dev>; Wed, 11 Nov 2026 09:46:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE5D7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=darioackermann.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darioackermann.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=maileroo.info header.i=@maileroo.info header.a=rsa-sha256 header.s=mta header.b=US3OZ6p/;
	dkim=pass (2048-bit key, unprotected) header.d=darioackermann.ch header.i=@darioackermann.ch header.a=rsa-sha256 header.s=mta header.b=dwHHwbZ/;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=darioackermann.ch header.i=@darioackermann.ch header.a=rsa-sha256 header.s=v1-rsa-20261020 header.b=J/R1EKHL
X-KumoRef: eyJfQF8iOiJcXF8vIiwicmVjaXBpZW50IjoicmVncmVzc2lvbnNAbGlzdHMubGludXguZGV2In0
	=
DKIM-Signature: v=1; a=rsa-sha256; d=maileroo.info; s=mta; c=relaxed/relaxed;
	bh=NaNsA5eyMMzZsBJWrElEiCkH2y5OkN7uDpy6upCkkj0=;
	h=from:sender:reply-to:subject:date:message-id:to:cc:mime-version:
		content-type:content-transfer-encoding:content-id:content-description:
		resent-date:resent-from:resent-sender:resent-to:resent-cc:
		resent-message-id:in-reply-to:references:list-id:list-help:
		list-unsubscribe:list-subscribe:list-post:list-owner:list-archive:
		list-unsubscribe-post:feedback-id:x-csa-complaints; t=1794390357;
	b=US3OZ6p/CQzz5hasjugLSeKjjJFQb3g+9V5bhRmdhiqMVMYWsdt/Vs67otaUBuy1YDOD5a2Ja
	UqALoSpk53vJQ9fq8mQzBU9l0ebjCBEaAQ2OXUpRuQ3YdcqAxO+E+82c6pUEuhB3kxpM0Zi2Mhg
	rYLU7Hhq0GCPnzDq7qSqX+wePrCPFFf8JfkahLsCN9RqWW9mh6kIXmx3dWwzJsLAUQ+UwwUiGjp
	APQjdUTTJllDAteu6CEDNhQEqNoHpABzSbf4es/HJXgKY26dt2KkKHfJTHtNfz3nxyt963EVDc6
	mxB1l2EdvMuA8FduyLn1+ShfsYkdruaZW++ps2I/1nXQ==;
DKIM-Signature: v=1; a=rsa-sha256; d=darioackermann.ch; s=mta; c=relaxed/relaxed;
	bh=NaNsA5eyMMzZsBJWrElEiCkH2y5OkN7uDpy6upCkkj0=;
	h=from:sender:reply-to:subject:date:message-id:to:cc:mime-version:
		content-type:content-transfer-encoding:content-id:content-description:
		resent-date:resent-from:resent-sender:resent-to:resent-cc:
		resent-message-id:in-reply-to:references:list-id:list-help:
		list-unsubscribe:list-subscribe:list-post:list-owner:list-archive:
		list-unsubscribe-post:feedback-id:x-csa-complaints; t=1794390357;
	b=dwHHwbZ/shwJMwFwepQhYE8FFBOnH8Xte3JJ8h8kEEi6namp5HGr8zON66lWhaM/Hm5D8+HDo
	nJhvE0nvlYocjVGqpw5nIk41FB4ZJyo6yUjlBJkbUlilhy2YCadkEADO0Jo0WKgUD9S5R9UU3vB
	grJQdsbCkRNCpMRu+8Djg39G5lLkA3LBymG2HpUwYw+G76cBW6hMDWauoxEdbArzsrrHsXmAdHv
	/Eod+ECv1gkJ6U7a7hjMYNx11ub5Lo34f49oBjXAFnkcOS+js+D9wNglZ3sDH3C8XoB/ryHBgf5
	TVrWVbi3wkjtsGU6dGaP6CsD1ko6n2klOeErCy5jWIiA==;
Received: from localhost (127.0.0.1)
  by mta3 (KumoMTA 127.0.0.1) 
  with ESMTP id b1b9ebdaddb411f1be6192000677b433 for <regressions@lists.linux.dev>;
  Wed, 11 Nov 2026 09:45:57 +0000
From: "Dario Ackermann" <dario@darioackermann.ch>
Date: Wed, 11 Nov 2026 09:45:52 +0000
Content-Transfer-Encoding: quoted-printable
Cc: "Thorsten Leemhuis" <regressions@leemhuis.info>, <linux-kernel@vger.kernel.org>, <regressions@lists.linux.dev>, <x86@kernel.org>, <tglx@kernel.org>
Subject: =?us-ascii?Q?AW:_[REGRESSION]_x86/microcode:_boot_hangs_bringing_?= =?us-ascii?Q?up_first_secondary_CPU_on_i7-6700HQ,_avoided_by_dis=5Fucode?= =?us-ascii?Q?=5Fldr?=
References: <mw9nsyuj.70b4b79c-e987-49da-abe1-0164defd8d5a@darioackermann.ch> <630330232567670562275469.6204.202611921938@darioackermann.ch> <8a0a9e63-54c2-4e5d-9479-1e39946328c4@leemhuis.info> <691747894523180440145931.1352.2026111016821@darioackermann.ch> <20261110185257.GFavNoCWszSXhRkaOV@fat_crate.local>
Content-Type: text/plain; charset="utf-8"
Message-ID: <717298194521931484515506.2022.2026111194557@darioackermann.ch>
Feedback-ID: u56201:maileroo
X-Maileroo-Ref-Id: 31a4f1357ac18b947a534d4e
DKIM-Signature: v=1; a=rsa-sha256; s=v1-rsa-20261020; d=darioackermann.ch; c=relaxed/relaxed; r=y; h=Date:Message-ID:Subject:To:From; t=1794390354; bh=NaNsA5eyMMzZsBJWrElEiCk H2y5OkN7uDpy6upCkkj0=; b=J/R1EKHLq6hZaMQpUr5MhAW9+zif9md4C2a7XYVXXH1ZInG5Da QDeZ1wTvpJ61o91TUa0mcKioLmDPfclftY3VLBw+TAFHWi8gdwd257S/JQXvi9N583mPi7+qvak vltiKbZy4y8sLjapPM6h9skM8oSAnKdYVKPNCsFaYUrdEZdOFIb6OboNQOK2v/Sk3aAquMwd68h u+shyHfAVKmzsgEMdj7LxD28zDnsK/a9E67WUkYUdDxhAGq+fNWEkzOy+YgYsBWCJ8iwJAxSpvX GC0ufieNl6uYJNnwa7LmcGUof39Ha4c0OENHrnGwGwS296WJRIfK4HbCzgeg5duH7fg==;
To: "Borislav Petkov" <bp@alien8.de>
In-Reply-To: <20261110185257.GFavNoCWszSXhRkaOV@fat_crate.local>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-CSA-Complaints: csa-complaints@eco.de
X-Tenant-Id: u56201

> Ok, so I don't understand: which kernel did work fine, without any cmdlin=
e
> switches?
>
> Pls send full dmesg from that one. IOW, did any kernel at all load microc=
ode
> successfully on your machine?

6.1, and yes. I had only tested the Manjaro build before. Vanilla 6.1.189
also updates early to 0xf0 and brings up all eight CPUs

https://drop.ackd.xyz/n552vx/dmesg-6.1.189.txt

Not perfect either: ~1 boot in 10 black-screens, as in my first mail.

Second case, from that same mail: 6.18.55 with maxcpus=3D1, then onlining
CPUs 1-7 from sysfs, leaves all eight on 0xf0. Log for that:

https://drop.ackd.xyz/n552vx/dmesg-6.18.55-maxcpus1.txt

> Also, send one from 7.4 with dis_ucode_ldr on the cmdline.

https://drop.ackd.xyz/n552vx/dmesg-7.4.0-rc2-dis_ucode_ldr.txt

Boots all eight CPUs on the firmware revision:

  [    0.000000] x86/CPU: Running old microcode

> Also, check whether you're running the latest microcode packages by updat=
ing
> your distro blobs.

intel-ucode 20260925-1, newest available for manjaro at that point. 0xf0
(2021-11-12) is the latest for signature 0x506e3, pf 0x20.

> And put your reply under the text you're replying to, like I just did.

Done.

Both kernels are vanilla (v7.4-rc2 at 7475ea8b5861, 6.1.189 from
kernel.org), rebuilt with NVMe, ext4 and console built in so they reach
userspace.

My best suspicion at the current time is that it is related to SMP startup =
and
that disabling the microcode loader prevents a (firmware?) race there.=20

Dario
