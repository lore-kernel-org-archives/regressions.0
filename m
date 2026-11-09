Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.241.220.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794258587;
	b=IL1lwmQCRQJ+NBjIci3RIpBHr8rzyE6NIoaxb42NF5G1NMI1Ekybye80Rl4SDN9yb4HD
	 pvIQhoN9ubBPngVZNNxt7Kx/3sS8Nnfej46/l6+0E1e9+PCEwvV5/dR89OB5XVx83raeE
	 cpDqiz6eNAROIgJJXepmMyj+GgvF5fMEcAdcsyq3puRi6upQg5U1c0tgw/bIYNPjOzL1Y
	 norhPNzKNRMOYOXU7zTVBjpnZ4pLTGpGPC9EZptlF/mILs3gXTQ0VZvpoAVeas0vtSeIe
	 yYsN0b00xr9OQ4BYIlSnxHMYP5oOHoCnW2s5U/tPi9l1vz5VIVpr25FP7lYJRjrGpWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794258587;
	h=DMARC-Filter:X-KumoRef:DKIM-Signature:DKIM-Signature:Received:
	 Message-ID:Date:Content-Type:References:X-CSA-Complaints:From:Cc:
	 Content-Transfer-Encoding:Feedback-ID:X-Maileroo-Ref-Id:
	 DKIM-Signature:To:Subject:In-Reply-To:MIME-Version:X-Tenant-Id;
	bh=0xeYOXy87vRk1HG34LnslJREtedPrEqOahPX4I7WggQ=;
	b=GG7rbGEDGHiKXp5Rd2Fm62KvhWarsI4iOvaFNy3Okarf8ptTBP7d+ZruZHlmG5RlDtOK
	 CmqNbRoD2J/Wn64AGNaqel9tRNtGyD0PMOJBsP+cYYjsHTPAFtSZSlb3NSaSNLuE/s5ky
	 qfdse/e0x+qzzhLxcpa50Eyp3YMRtNI7F0M2Tav2+4AWALxwQhFteinP/3Y5gBHKbGKKA
	 OxyBVlGyUyV7Ppn/wZbi/deHWECvYQpOEXkKMdWuHcC3d06c5c3xhQ06HSOAFtyPnhJzY
	 /OdaLl3aM07E2FPRluTOAp1JNr/3q9+Q9iXu/hmBhCvtujGkY9MR3dI8G5KOmWfQCzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=darioackermann.ch;
	spf=pass smtp.mailfrom=darioackermann.ch;
	dkim=pass header.d=maileroo.info header.i=@maileroo.info header.a=rsa-sha256 header.s=mta header.b=G7tx7aiN;
	dkim=pass header.d=darioackermann.ch header.i=@darioackermann.ch header.a=rsa-sha256 header.s=mta header.b=JR4E78rj;
	dkim=fail reason="signature verification failed" header.d=darioackermann.ch header.i=@darioackermann.ch header.a=rsa-sha256 header.s=v1-rsa-20261020 header.b="AyxSA4/w";
	arc=none smtp.remote-ip=188.241.220.1
Received: from mta3-5.maileroo.com (mta3-5.maileroo.com [188.241.220.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65348606A31C
	for <regressions@lists.linux.dev>; Mon,  9 Nov 2026 21:09:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65348606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=darioackermann.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darioackermann.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=maileroo.info header.i=@maileroo.info header.a=rsa-sha256 header.s=mta header.b=G7tx7aiN;
	dkim=pass (2048-bit key) header.d=darioackermann.ch header.i=@darioackermann.ch header.a=rsa-sha256 header.s=mta header.b=JR4E78rj;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=darioackermann.ch header.i=@darioackermann.ch header.a=rsa-sha256 header.s=v1-rsa-20261020 header.b=AyxSA4/w
X-KumoRef: eyJfQF8iOiJcXF8vIiwicmVjaXBpZW50IjoicmVncmVzc2lvbnNAbGlzdHMubGludXguZGV2In0=
DKIM-Signature: v=1; a=rsa-sha256; d=maileroo.info; s=mta; c=relaxed/relaxed;
	bh=0xeYOXy87vRk1HG34LnslJREtedPrEqOahPX4I7WggQ=;
	h=from:sender:reply-to:subject:date:message-id:to:cc:mime-version:
		content-type:content-transfer-encoding:content-id:content-description:
		resent-date:resent-from:resent-sender:resent-to:resent-cc:
		resent-message-id:in-reply-to:references:list-id:list-help:
		list-unsubscribe:list-subscribe:list-post:list-owner:list-archive:
		list-unsubscribe-post:feedback-id:x-csa-complaints; t=1794258578;
	b=G7tx7aiNp5ELlQdci/BDKS86S50hv/xrdxk5YLy0aOWq9YvyUY7B2WIIsnl/KywcNc+6h231q
	YN4Rz+Ud+bRhU+uLXFG4tqquHUd3xUHyU8+S26ZH40+SMNH2qUtTObVGkxYRU65dmhlEX7lwKSu
	PlBW2ydaplUFAvKYjcTAtW2Sh6O0u4k/rq9LZSrdKzt/dFJpn6dkqk4EEns55ez9kdxinbWzbKX
	F0MhjVEZX0CH/HYwGiievlqKNhk8WoCt7nY6nnGEyMLGHrt9LwEcSIyp/Ojfch1TCxIGcS0zPSJ
	iI7cfjNqvKawXa6vnWpgKc6jSweX6UGNcSGCvL2reeHA==;
DKIM-Signature: v=1; a=rsa-sha256; d=darioackermann.ch; s=mta; c=relaxed/relaxed;
	bh=0xeYOXy87vRk1HG34LnslJREtedPrEqOahPX4I7WggQ=;
	h=from:sender:reply-to:subject:date:message-id:to:cc:mime-version:
		content-type:content-transfer-encoding:content-id:content-description:
		resent-date:resent-from:resent-sender:resent-to:resent-cc:
		resent-message-id:in-reply-to:references:list-id:list-help:
		list-unsubscribe:list-subscribe:list-post:list-owner:list-archive:
		list-unsubscribe-post:feedback-id:x-csa-complaints; t=1794258578;
	b=JR4E78rjsdo/LyzO28ZaXeRDRYbjG6EDpxim0C+C4XXIRWQ8qPvajnSGvvLKte+xRv23kgNUS
	xHiAHGoLMRs0zEx1edi6zTJdOTgu1fgdpDxMss7/bWckZRcWYXkyCvREF3VlZ81FaYxvhP37f4f
	BzS8ENJnM23bVHlzDArepS4e726GJhyH45+5kzA0BeZvdM5IWp+wFOUJIN98mX6hSpaAZeze1tY
	aJLOWKzFyXavvZkT01/IR6Pb6xP/z0uL2NybjIfbOm/w3YxHLbBqVJZ6jkXJY86GVAAjNgg+0e+
	EzuaixRgVlrO76Cq+Be9cRlIWXB83gWd3ot/3S7PhYKA==;
Received: from localhost (127.0.0.1)
  by mta3 (KumoMTA 127.0.0.1) 
  with ESMTP id df77f3e2dc8111f1a92b92000677b433 for <regressions@lists.linux.dev>;
  Mon, 9 Nov 2026 21:09:38 +0000
Message-ID: <630330232567670562275469.6204.202611921938@darioackermann.ch>
Date: Mon, 9 Nov 2026 21:09:32 +0000
Content-Type: text/plain; charset="utf-8"
References: <mw9nsyuj.70b4b79c-e987-49da-abe1-0164defd8d5a@darioackermann.ch>
X-CSA-Complaints: csa-complaints@eco.de
From: "Dario Ackermann" <dario@darioackermann.ch>
Cc: <x86@kernel.org>, <bp@alien8.de>, <tglx@kernel.org>
Content-Transfer-Encoding: quoted-printable
Feedback-ID: u56201:maileroo
X-Maileroo-Ref-Id: 4f4cd805c44985a0c1e09e10
DKIM-Signature: v=1; a=rsa-sha256; s=v1-rsa-20261020; d=darioackermann.ch; c=relaxed/relaxed; r=y; h=Date:Message-ID:Subject:To:From; t=1794258575; bh=0xeYOXy87vRk1HG34LnslJR EtedPrEqOahPX4I7WggQ=; b=AyxSA4/wfkPTIZ+eB4B7aN2uzxfg+ZVMPO7XoNwObNYLmlvlF7 QMJFW6/I9B9f+sUANWuIE0+O2mkiz6M75hcoDMQUUv7Px7TUyegj6ZuZpf5XvJ5dea+cvFDOkXz ecqxbllVZHrZnTbTP/pH15s/AyjXl0OrRtZybOrQhys0zas26NkZ/gFCEwugQjVyVCVu1ztduC8 sVoZ7viG3bZU5BGOCHsS0f8j+tdMXrBvv3/ogDQ6UbYVSvr1g6E3bN+SOdWLl3FsBCWGsqbO6Yv OtUDduh+z1sJ5hFXp782D9No2qusVxT1vSBm5xP6nibgA1JUA/OVKyyg+xY2Tk61EpA==;
To: <linux-kernel@vger.kernel.org>, <regressions@lists.linux.dev>
Subject: =?us-ascii?Q?AW:_[REGRESSION]_x86/microcode:_boot_hangs_bringing_?= =?us-ascii?Q?up_first_secondary_CPU_on_i7-6700HQ,_avoided_by_dis=5Fucode?= =?us-ascii?Q?=5Fldr?=
In-Reply-To: <mw9nsyuj.70b4b79c-e987-49da-abe1-0164defd8d5a@darioackermann.ch>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Tenant-Id: u56201

I found two similar reports on ASUS N552V-series laptops with an Intel i7-6=
700HQ:

Ubuntu N552VW: the reporter tested upstream 6.4.0 as working and 6.5.0 as f=
ailing. Boot stopped at "smpboot: x86: Booting SMP configuration:", and dis=
_ucode_ldr allowed booting.
https://askubuntu.com/questions/1512327/ubuntu-freezes-during-boot-when-usi=
ng-linux-kernel-6-5-0

openSUSE N552V: the reporter says 6.1 works, newer kernels hang when Intel =
microcode is present, and dis_ucode_ldr allows booting.
https://forums.opensuse.org/t/opensuse-tw-wont-boot-without-the-dis_ucode_l=
dr-parameter/175229

Commit 0c7ffa32dbd6 ("x86/smpboot/64: Implement arch_cpuhp_init_parallel_br=
ingup() and enable it"), merged for 6.5, moved AP microcode loading from af=
ter the AP startup handshake to before it. This is a candidate cause, not y=
et confirmed by a bisect or patched-kernel boot test on my N552VX.
https://git.kernel.org/linus/0c7ffa32dbd6b09a87fea4ad1de8b27145dfd9a6

I am preparing two upstream 6.18.55 boot images, one unmodified and one wit=
h the AP microcode call moved after the handshake, for a direct comparison =
and to work on a potential fix
