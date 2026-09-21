Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [185.244.194.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B71642E8D6
	for <regressions@lists.linux.dev>; Mon, 21 Sep 2026 11:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.244.194.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789990566; cv=none; b=PbWMLItpDxoQo2mjXXEv/gkj1E3OG4mRkr0R00wKiwPPJiffcRKGl8MAh7HttnIRxDQ65x+k2q4+h4TXXP1jPGCPVR4TlMb+NCNfgyy+eQYg63vSV1xkRbMJDrXkVZ00xmqFN2R5nAw7O7q3YJWaWD/whXihSCrv4lTBzd8JEKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789990566; c=relaxed/simple;
	bh=/Zy4KN+ipLuwEJvNyGJC7wVL3noR9zjTaHx+Hh45nSo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=jU6cMUTO551Ukm6i2CMixQpXj3v/j60BcVaVa5AaYYc1AFcctDAkpHonkhWJYi/7FkQetoAGXMw9C1m1dCz1ycfc45YAPyavRD6EehKQjgB+v8zaCwQ7lkoFoRDLFxg2ydHnNpdDkPR6SoI3Zs+Ybl2vjo5L+DZ3u/CjWwNU1s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=G3QMbNve; arc=none smtp.client-ip=185.244.194.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="G3QMbNve"
Received: from relay01-mors.netcup.net (localhost [127.0.0.1])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4hpLjh6d4sz98w6
	for <regressions@lists.linux.dev>; Mon, 21 Sep 2026 13:34:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1789990472;
	bh=/Zy4KN+ipLuwEJvNyGJC7wVL3noR9zjTaHx+Hh45nSo=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=G3QMbNveg08lmONUrBOi22lpDeoh0gudF06Hyv2gwiYLr0X4dBiDFNaJFJ+jeW+Vt
	 ToPpzp6Qz4vHMAqDZjNoh3XPXrDQFc1bpM+53k51ox42rcqarxS0UZygLl4Vflerdn
	 1zLcqYpWVetPtXYSPZbsnkt3DmQTbA/A2NZJtYdTLfQxMDjnNeHMVvyjodMlhb/9YN
	 6fqRnlOmzb3aOV5GXWdL8GeCtsDxeRD2l3C53KFVMfqcKt93IxlfTalInKGgVOA2kY
	 oWH4ctCShARdbPnpyNwmG7sAHAVTwbGrxmXJ1OUzYhM4VJLBQh/pDqUZoedlMIy2vz
	 gagdW2sUWp40g==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4hpLjh5x4Jz7xDJ
	for <regressions@lists.linux.dev>; Mon, 21 Sep 2026 13:34:32 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4hpLjh4Fc8z8scg
	for <regressions@lists.linux.dev>; Mon, 21 Sep 2026 13:34:32 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 1C6215FAE9
	for <regressions@lists.linux.dev>; Mon, 21 Sep 2026 13:34:32 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <331e858d-c1ff-4671-864b-936426be6289@leemhuis.info>
Date: Mon, 21 Sep 2026 13:34:31 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Thread for updating minor properties of tracked regressions
 [consider ignoring it!]
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: Linux kernel regressions list <regressions@lists.linux.dev>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <178999047228.321920.10352536234462822961@mxe9fb.netcup.net>
X-NC-CID: 6qmNPmiEHCg/kH7pTVq7tmn3csIdl705ZR0FYhMgO0MEy50LBQQ=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/56a4bc35ee605588b7cc36c8e45c12b5f3b506cb.camel@guillain.net/
#regzbot introduced: 97d65b544f48
#regzbot title: kvm: BUILD_BUG_ON for kvm_vmx struct size sanity check
in vmx.c
#regzbot dup:
https://lore.kernel.org/all/CABD=WFOS4j4hDv+pW-eEM9HAM2q2GY_iYdAG+qvYcUEinUrcQQ@mail.gmail.com/
#regzbot monitor:
https://lore.kernel.org/all/20260914181223.289061-1-seanjc@google.com/

#regzbot report:
https://lore.kernel.org/all/20260901-bolt-scroll-fix-v1-1-58bca7ae487f@protonmail.com/
#regzbot introduced: 022eb347ff3a
#regzbot title: HID: logitech: MX hi-res scroll broken by newly added
Bolt receiver support
#regzbot dup:
https://lore.kernel.org/linux-input/20260904034843.1340846-1-rafael@rcpassos.me/

#regzbot report:
https://lore.kernel.org/all/20260920094508.39682-1-roman.stingler@gmail.com/
#regzbot title: HID: logitech: hi-res scroll broken after supend and resume

#regzbot report:
https://lore.kernel.org/stable/CALjEBWQo0-Sdimo%2BaRNKUQvgDGw=jBFCcfwCXaqVdtoPrHLAQA@mail.gmail.com/
#regzbot dup:
https://lore.kernel.org/stable/CALjEBWT9wyBYtWPgtg8Xd_FxRU_XnatzQMcwMB9_P2Fdj83%2BcQ@mail.gmail.com/

#regzbot report:
https://lore.kernel.org/all/CANzgjV0YWUX6%3DZGTbn4KEKqQmVhsZTsDPeRf0Nfq%3DYFT1eoPzA@mail.gmail.com/
#regzbot dup: https://bugzilla.kernel.org/show_bug.cgi?id=222041

#regzbot report:
https://lore.kernel.org/all/20260903121218.4955-1-nikprica@amd.com/
#regzbot introduced: 1ae8c4ce1570
#regzbot title: PCI: atomics operations for headless passthrough devices
broken
#regzbot dup:
https://lore.kernel.org/all/3f5fb659-c7a8-41cd-91dd-565cb46c0165@amd.com/


