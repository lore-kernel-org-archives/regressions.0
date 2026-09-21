Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.61.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9FDE3769E1
	for <regressions@lists.linux.dev>; Mon, 21 Sep 2026 07:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.61.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789974992; cv=none; b=PJpDCFOfMDjQl3skUjYrqNp73Nsj3QQoXgpGbjaLy9d7lEQrl7nKwQeOEUTzFYvUK2fmXnsPdnSaMrEPz1oP+E2qD99KFXz4MmfNWHLEnjMykNM5J8bC6yOJQslbS/pk9Ldq4APrqmYX9tlKhBcGXPcdWaVUOa14RwXznNqwLN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789974992; c=relaxed/simple;
	bh=VLcJk4lsf28RYu4j18sXeKy2fu6/7WckQGZEdCmD4L0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t17IuINehx/6yfzMwyfNT73GLi1Hbtdr4hKxuuaLD/bvWBMLq3OvZkN2Q4hHbJKi0UJzBaM7+JIPJWcaN2vLEkAOAuhI7x8Z3JcrB9vli0uid/RMQiluXG3RkZRu3v35JNf0iWxxH84Q0x4xUWpUwT4OFLURWTcYTLtDXZ+tFXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=GW6ab6xa; arc=none smtp.client-ip=188.68.61.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="GW6ab6xa"
Received: from mors-relay-8403.netcup.net (localhost [127.0.0.1])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4hpDzn58RVz8L7T;
	Mon, 21 Sep 2026 09:16:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1789974981;
	bh=VLcJk4lsf28RYu4j18sXeKy2fu6/7WckQGZEdCmD4L0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GW6ab6xaJLXrH8FCdm6aVwErELN8WaGmzc28jzMEzvepjSMDOWZa/jrfo8+K/+fd5
	 iFpUFA0LxIRGlMgFWc4BCCam2e7HzCEDgdSgKgBp3sV70ouv2WQ9sXCpGtmNkh+FEQ
	 N//GxweZxaNMJL/ga8teb2/Tu7lJM/FFxyTcNjkaZnPS9QvR9kO1XOaK5Wl92ZMiwP
	 vBkoRpBLp5fZqTNUP4dKH8JXtFtFlFp7hxERoUPYZQDjxOMqjAD3G+BOl0YPZaiKN+
	 N3VlEnqR2TjhrktDgtlKX1e5yg38VU/pm+0+sDgsEzRZjwPKsWpuS3vgC9sjM9lVkS
	 BwuGqFEga8xEg==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4hpDzn4RkMz8Jk7;
	Mon, 21 Sep 2026 09:16:21 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4hpDzk3b0Kz8tjc;
	Mon, 21 Sep 2026 09:16:18 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 9DB515F96B;
	Mon, 21 Sep 2026 09:16:13 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <2b067a4a-6da8-4948-ab50-46f1c6193ed1@leemhuis.info>
Date: Mon, 21 Sep 2026 09:16:12 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=5BPATCH_1/1=5D_media=3A_Don=27t_hide_I=C2=B2C_or_S?=
 =?UTF-8?Q?PI_drivers_by_default?=
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Junjie Cao <junjie.cao@intel.com>
Cc: Miguel Vadillo <miguel.vadillo@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Manuel Knitza <manuel.knitza@googlemail.com>,
 Antti Laakso <antti.laakso@linux.intel.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>, linux-media@vger.kernel.org,
 regressions@lists.linux.dev
References: <598cd300-dbec-44fc-a670-f575310e6a43@leemhuis.info>
 <20260920020347.709849-1-junjie.cao@intel.com>
 <arDUk1RugOuxI74d@kekkonen.localdomain>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <arDUk1RugOuxI74d@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <178997497407.4020315.9293366670673163166@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 9DB515F96B
X-NC-CID: l45LT0zxPGE1gi+htJ9sasPQxjOdQH+lJUOUkTmjDmREU1K2dBM=

On 9/21/26 08:54, Sakari Ailus wrote:
> On Sun, Sep 20, 2026 at 10:03:47AM +0800, Junjie Cao wrote:
>> On Sat, Sep 19, 2026 at 09:10:18AM +0200, Thorsten Leemhuis wrote:
>>> Also wondering if the "olddefconfig" case on Arch was tested to ensure
>>> we prevent more people running into problems that Junjie's fix linked to
>>
>> Ran it: this patch on its base-commit, Arch's
>> config.x86_64 (7.2.4.arch1):
>>
>>   olddefconfig, before: no VIDEO_INTEL_CVS line
>>   olddefconfig, after:  # CONFIG_VIDEO_INTEL_CVS is not set
>>
>> The option has no default, so olddefconfig leaves it
>> off. With the patch, oldconfig prompts for it as (NEW)
>> and listnewconfig lists it.
> 
> Generally drivers are unselected by default and cvs is no exception.

Yup, sure, but it seems we here due to some oddity (details don't matter
much) ran into a situation that users perceive as regression (which
matters a lot).
> What I think we could possibly do is to add to cvs Kconfig:
> 
> 	default VIDEO_INTEL_IPU6
> 
> As the cvs driver is (at least right now) used with ipu6 driver only.

Due to what I wrote above I'd say: this sounds like a good solution that
has no significant downsides -- and avoids a problem for everyone that
manually configures their kernel in the future, which is a good thing,
too. And we can easily drop the default later if there is a strong need
(and then likely should add a hint to the help text which other symbols
are needed in case it doesn't have one already; didn't check)

Ciao, Thorsten
