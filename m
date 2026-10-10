Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [46.38.247.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29FF4A3877
	for <regressions@lists.linux.dev>; Sat, 10 Oct 2026 12:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.38.247.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791636333; cv=none; b=sWOPoSeMF3+O0bSHXa3ZjTXaYq6H8rW61omsisH0eV1kW1Db0F1rnbmHQ157XpcFy14UanTrK7weHxzN1q3NWMaQBRcTB7ouN8SQCmyUG2YxFjJ5hjtcI7JJk81FOHloc5kMqSp03p/eQyIQ1EzX36nbd/fj+RqmZ9iF/p+ewu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791636333; c=relaxed/simple;
	bh=+N35eRB1/+8vuA8TF49TTq/ynuoK2bxAscwd7Uj95UY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=QaEqWUgXnpLRnHwx3C7kcbVgU+AFV4xvQeeB9Db4i4u4t72nSPfy/mIOohxIow5zvQqla8KJpc83gvu29o7RtnuIxvxFd+liyWsgDHXxqdCteQl94wRROZOpLnKi+Gy6/Bb+JTcVfNI+GZx9CwXg/SasHG7As94KKCkBBj6ZcPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=mCG1BivO; arc=none smtp.client-ip=46.38.247.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="mCG1BivO"
Received: from mors-relay-8404.netcup.net (localhost [127.0.0.1])
	by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4j23Nb71wlz8Mh1
	for <regressions@lists.linux.dev>; Sat, 10 Oct 2026 14:45:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1791636320;
	bh=+N35eRB1/+8vuA8TF49TTq/ynuoK2bxAscwd7Uj95UY=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=mCG1BivOjgEW2EEChiwEU+3c/tn/b9kFR56ZB47y/dAut0mmQwUHfsHIZJl7Dm1rV
	 kE9OlcyZlnl7xhUhPVZixTCQP+plhtHm4oh7pmBl+CogElKzRVR1CSdyrexGXFxLpi
	 2oHnjXObKDWd9e89KBxQ8cTPOPbOAsPXWDDReJIMy6XM+fzYEl8Y7kqM9uG31G5Qww
	 NpawUSSCBNP2TsNbdFq32xHPW/oyQXII31EBhiB9+nc4eE2AOCDweifbejbMPMmSVg
	 eMTdBRtLu6dntMfT/782Zatv+3fqXsJ1PXkPJ1LUI071yYmeJsc6NBGQSPz+zVRDeI
	 ydLDjbwnnFzAg==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4j23Nb6Lzcz4xFJ
	for <regressions@lists.linux.dev>; Sat, 10 Oct 2026 14:45:19 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4j23Nb4q6yz8sb3
	for <regressions@lists.linux.dev>; Sat, 10 Oct 2026 14:45:19 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 0EF6D5FA0A
	for <regressions@lists.linux.dev>; Sat, 10 Oct 2026 14:45:19 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <7a6c2dd3-0595-4fcf-b2cd-e5c22c552f0f@leemhuis.info>
Date: Sat, 10 Oct 2026 14:45:17 +0200
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
X-PPP-Message-ID: 
 <179163631924.3411612.17598010565263186087@mxe9fb.netcup.net>
X-NC-CID: kF7YmbuoC2RvkoiP8tlMSj5b3Clq3xW8rQKiDWZ73F8753fpvKM=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/netdev/CAPa5EdCj3v17tB-SF2JNecq5Q8s1Pranr-XzAFWNpNTBPgPG7w@mail.gmail.com/
#regzbot introduced: 1517d1996b5236fe69eccd9d253f725e06996eb1
#regzbot fix: vlan: do not insert the vlan header in vlan_dev_hard_header()

#regzbot report:
https://lore.kernel.org/lkml/CANzgjV0YWUX6=ZGTbn4KEKqQmVhsZTsDPeRf0Nfq=YFT1eoPzA@mail.gmail.com/
#regzbot introduced: ffe8a0c6b552
#regzbot title: pinctrl: amd: Don't clear S4 wake bits at probe causes
power off to reboot AMD Ryzen laptop
#regzbot fix: pinctrl: amd: Clear S4 wake bits when firmware has _AEI

#regzbot report:
https://lore.kernel.org/netdev/4F0FAEB6-A13B-47F3-BFF1-C706686C6F64@gmail.com/
#regzbot introduced: f19186bb71d0a6
#regzbot title: net: TCP through relays broken when the peer's network
drops ICMP

#regzbot report:
https://lore.kernel.org/all/CAELqY9%3DeoM-v816v2otCNitOgAFnrWZ776F3RECwPOwKveA%3Dzw@mail.gmail.com/
#regzbot dup:
https://lore.kernel.org/all/CAELqY9%3D%3DTer2XQPRp%3DgjW5T75T%2B7kcZCXpn5roF2L6tY6mQNxw@mail.gmail.com/
#regzbot title: btrfs: fs-verity "FILE CORRUPTED" on readahead of
compressed extents
#regzbot fix: btrfs: fix the fsverity callback where unexpected range is
verified

#regzbot report:
https://lore.kernel.org/all/20261010071811.20483-1-yiyu@yiyuzhou.io/
#regzbot dup:
https://lore.kernel.org/all/20261010064407.11030-1-yiyu@yiyuzhou.io/
#regzbot fix: xhci: give back halted TD when skipping endpoint reset
after disconnect




