Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13AF74050
	for <regressions@lists.linux.dev>; Fri, 31 May 2024 07:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717141148; cv=none; b=Qchd8WoH3OrACv+A0vAi1v+9/sNLftvTEmfqE3Rgwr+kSNbT+1X1rptMfvOLFY5O5e3kswukmeY5CXz4wXSv8ojZP6Q4URDR1e4o1TqwTksXcLC5LsHyyW5eXWehn6z4mYBjAbalRvHbVIavLV5Ac+4HRxMA4LVRDZzE98cmABI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717141148; c=relaxed/simple;
	bh=UASv3SveAZm8Gka6pqaR1UV3bTzZva87d51sF3d3LV8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=GBiSm1gWGLc1NnzQeflAzcPzMObLE0hYQpzo7pokfJaffvYdB3kPgkUWmV6dzSmhLZfy08TjX+YRN1AousNpXx/4HEZtVHcyf3Xxnjpt0exqKdxjU/n1WmlK0Px8P73RCW/kVW6J892ljHf8+zOBWZY0j+CZdxZL0dQagL3OMuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=mnx/AJKj; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="mnx/AJKj"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:
	From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=UASv3SveAZm8Gka6pqaR1UV3bTzZva87d51sF3d3LV8=; t=1717141146;
	x=1717573146; b=mnx/AJKjjb7k3N/wlrxN66b0gxzUnn8THC7bEIRmoBcJWS/NvAD00LyLLaCXD
	P2rOPQSu/cpb5TaR1cpBaoCEVptJzawJTX3Bo+Hoo/B1EIYi/6GxmHqd0RPW4WdXleBcoLloTBuLZ
	bdO/NJxeskQgVeBnwi6eV0TffDJ2eITvqpCbXYokXxpu3vFeF/enWURrJJwTk9YuAgrH+Icaoqf1S
	6frl9FKjBoXNtq2WOJhJARxt9m1JW7uiC+BOObVgGxxUY4B8Rytni+i/P7e34tMmQh0fTVnArERiM
	TUma13wRLOCoRzbE0AdoaEpQCI8+ZuLG8KI4ZkdQgLVgNwOGfw==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sCwqu-0000bt-J0; Fri, 31 May 2024 09:39:04 +0200
Message-ID: <144eb23f-ae27-46ff-83e7-9a764e58587e@leemhuis.info>
Date: Fri, 31 May 2024 09:39:04 +0200
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
Content-Language: en-US, de-DE
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1717141146;5e5cc072;
X-HE-SMSGID: 1sCwqu-0000bt-J0



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://lore.kernel.org/all/Zj0ErxVBE3DYT2Ea@gpd/
#regzbot introduced: 80105ed2fd2715fb
#regzbot summary: 9p: autopkgtest qemu jobs broken
#regzbot duplicate:
https://bugs.launchpad.net/ubuntu/+source/autopkgtest/+bug/2056461
#regzbot duplicate:
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1072004
#regzbot relate:
https://lore.kernel.org/all/1567252.1715290417@warthog.procyon.org.uk/
#regzbot relate:
https://lore.kernel.org/all/531994.1716450257@warthog.procyon.org.uk/

#regzbot report:
https://lore.kernel.org/lkml/6d0da90d-f405-4b5d-b7f9-238cc9405ebe@notapiano/
#regzbot dup:
https://lore.kernel.org/all/8ae675b5-fcf9-4c9b-b06a-4462f70e1322@linaro.org/
#regzbot dup:
https://lore.kernel.org/all/4748499f-789c-45a8-b50a-2dd09f4bac8c@notapiano/
#regzbot fix: spi: Assign dummy scatterlist to unidirectional transfers
#regzbot monitor:
https://lore.kernel.org/all/20240529-dma-oops-dummy-v1-1-bb43aacfb11b@collabora.com/

#regzbot report:
https://lore.kernel.org/all/ebb3b35e631169041e70eb0a7efd6cecef609833.camel@sjtu.edu.cn/
#regzbot introduced: v6.9..v6.10-rc1
#regzbot summary: drm/amdgpu: crash on playing videos

#regzbot report:
https://lore.kernel.org/all/CAK8fFZ7MKoFSEzMBDAOjoUt+vTZRRQgLDNXEOfdCCXSoXXKE0g@mail.gmail.com/
#regzbot introduced: 3e41af90767d
#regzbot summary: rtnetlink: Dell's OMSA Systems Management Data Engine
stuck

#regzbot report: https://lore.kernel.org/all/87v82y6wvi.fsf@kernel.org/
#regzbot introduced: 7e89efc6e9e4
#regzbot summary: PCI: KASAN: use-after-free in
lockdep_register_key+0x755/0x8f0
#regzbot fix: PCI: Revert the cfg_access_lock lockdep mechanism
#regzbot monitor:
https://lore.kernel.org/all/171711746402.1628941.14575335981264103013.stgit@dwillia2-xfh.jf.intel.com/

#regzbot report:
https://lore.kernel.org/all/9d189ec329cfe68ed68699f314e191a10d4b5eda.camel@sapience.com/
#regzbot introduced: v6.8..v6.9
#regzbot summary:
