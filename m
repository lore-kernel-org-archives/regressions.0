Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E179EDDA6
	for <regressions@lists.linux.dev>; Sun, 21 Apr 2024 11:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713698608; cv=none; b=t9qiyAEBgn7fmc8Lg0nRZxXQEBwUHtzbFucomR6+oAoqgAztpwttDr/ZpOcmeShgysL4aDwjkI5NxRwEZvcAwEVg3/tmnMOtnHYugiNOKJ8YXycHKZaclTnJDB3BgzzxgPIc9fgR/BDdwIBhbnD2kWWqqa4OyzVNf4RvqWpAoBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713698608; c=relaxed/simple;
	bh=JcQd/ZZbSvqj7oxwn/mx66oVNTLT6gY3CozQD8NKWbg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=m1piCikNs+MRhb9HX5H5xRNPgI7ieSZsHzIOQauinVy6uH2rTkqdiJ7xyVSc2PaRKeHrd4D5nqEqlV9bNZbV97RBcBEgVcfFrnqM5Z6cjiTpw5Z+m7VMFPG8sTMKrK6w7QxedH6sy/0dbpJ73pI878jcsyCEea6RToENc1ob7aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=bjqk9qys; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="bjqk9qys"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:
	From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=JcQd/ZZbSvqj7oxwn/mx66oVNTLT6gY3CozQD8NKWbg=; t=1713698606;
	x=1714130606; b=bjqk9qysgnHHBOApbRhuNJwU8cDkzQpKjiYBjIyY7+tAjvgx9CGoPlTyFWIcS
	wLrwTDDw2q2PUjOKT0rW6PtGOOHAhGKJjCQh7N/G5F+xIbXrBzABwM94v+rLxuY7ptv5Ug1h2BfuB
	LrtUa0SqMZSaGL7DPu4IRyErDs7R8UjVjCmjjZ15cTx3NcznoCBh6RftTYrGyTSj0xrwj7EoWN2fD
	JPIjhdUYRTm68cF3h/Y45k5MrkZhTv9wEcfK7OZGGkXV2qPpP0WB/SU8Kiw/lqC/spv2PIBy3ljX+
	gWpV9XX/c3yPhBZUoTEPFJdxxvPRH+cWo4lH/FpEfultdEktVg==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1ryVHy-0003s5-6B; Sun, 21 Apr 2024 13:23:18 +0200
Message-ID: <c2786db1-a8c9-4323-832e-cffd8373bf68@leemhuis.info>
Date: Sun, 21 Apr 2024 13:23:17 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Thread for updating minor properties of tracked regressions
 [consider ignoring it!]
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Linux kernel regressions list <regressions@lists.linux.dev>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Content-Language: en-US, de-DE
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1713698606;97105699;
X-HE-SMSGID: 1ryVHy-0003s5-6B



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://github.com/openSUSE/snapper/issues/894
#regzbot introduced: 86211eea8ae1
#regzbot summary: btrfs: snapper fails
#regzbot fix: btrfs: qgroup: do not check qgroup inherit if qgroup is
disabled
#regzbot monitor:
https://lore.kernel.org/all/bd677611fcbd89c21d60585e22c8d4aed3b90090.1713599418.git.wqu@suse.com/

#regzbot report:
https://lore.kernel.org/all/8c3f3a43-ac65-4bd1-9563-cb8d9192b0ce@message-id.googlemail.com/
#regzbot introduced: a8b5d4809b50
#regzbot summary: net: wifi: iwlwifi: Thinkpad 480 no Wifi
#regzbot fix: wifi: iwlwifi: mvm: fix link ID management
#regzbot monitor:
https://lore.kernel.org/all/20240420154435.dce72db5d5e3.Ic40b454b24f1c7b380a1eedf67455d9cf2f58541@changeid/

#regzbot report:
https://lore.kernel.org/all/3d77cb89857ee43a9c31249f4eab7196013bc4b4.camel@redhat.com/
#regzbot introduced: f0551af021308a
#regzbot summary: x86/topology: system stopped booting
#regzbot fix: x86/topology: Deal with more broken ACPI tables

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=218707
#regzbot introduced: 6613d82e617dd7
#regzbot summary: x86/bugs: dosemu crashes on some x86-32 machines
#regzbot monitor:
https://lore.kernel.org/all/8c77ccfd-d561-45a1-8ed5-6b75212c7a58@leemhuis.info/

#regzbot report: https://lore.kernel.org/all/Zh%2Ftyozk1n0cFv+l@euler/
#regzbot introduced: df16c1c51d81
#regzbot summary: net: phy: mdio_device: Beaglebone Ethernet Probe Failure

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=218750
#regzbot introduced: 073237281a508ac80ec025872ad7de50cfb5a
#regzbot summary: ACPI: PM: s2idle: sleep broken on 13th Gen Lenovo laptops
