Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B646FBF
	for <regressions@lists.linux.dev>; Fri, 19 Jul 2024 09:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721382287; cv=none; b=jhWcdEpH4x+K7XjOG+8xpSMtCogEVgub8pMJGPJD1gMX9R+kqfI9Bl1KILi7dUM0R+HOkinoNDSHHuuFPullFesfLYXX8w3RJWbNRK5vIQYTPvj+1+bVpLCuIVrj9/assB/Q9Z36AGzIrwj35xz8N5gxh7zd+88KWZrSsnOePfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721382287; c=relaxed/simple;
	bh=Mt94dJv93p4gadMAHrUU0whW8FUf/NSds7a+yWzs9gw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=USAGc1ET4TQakmkYuo6/IA1SIpOCdBW9ToWNRbxUBl2fsmTjf2rxF/gr2lyiqkw+8YNIw7LavkufYbeZd/Aj5w6SMlb1KZl+/Mc6/pImkhGRk5ZQ8bC9OBARZAoSo6bCJeuRfhjDfSbeOoT6RiYsNXinMFryrbETY2NNd9+Sg5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=toqXbq2f; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="toqXbq2f"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=Mt94dJv93p4gadMAHrUU0whW8FUf/NSds7a+yWzs9gw=; t=1721382284;
	x=1721814284; b=toqXbq2fSiuypx0oNKtIepr9qGzXXRuouqdAjlmSX5ahhrSXQ1YWbv50BCYhj
	kalOrPprKRKQ1HRkUFXydhqRBuuQZmpq2g/SO2A/TJTcgEuSP71AZkoIP6wZF6M5QA2WAjHU26fRn
	bigVXvGjMYp57c7I3ZhnYjgZDjPnZP+8eIV088FcmAxRrJvc0fmxzNdZXfXqBbvToqupEpPtNwSt0
	UW8x/ImPgz4yA+VI2NEFWrnPwyLpiJ8bckSstcmko/d89OGGEvkgwARlorpf6aaYSySxlOa6V9joa
	BhBq/Ge0QgB2OpebkUnnwx6I0LedjHQcyTiWm4666Xt5c+5w9w==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sUkAH-0006Ld-0J; Fri, 19 Jul 2024 11:44:37 +0200
Message-ID: <5d532252-7cbb-40ff-85b4-d638a2d86d29@leemhuis.info>
Date: Fri, 19 Jul 2024 11:44:36 +0200
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
Content-Language: en-US, de-DE
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1721382284;6aab83a1;
X-HE-SMSGID: 1sUkAH-0006Ld-0J



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/20240715044527.GA1544@sol.localdomain/
#regzbot introduced: a8a261774466d8
#regzbot summary: thermal: core: a lot of warnings like "thermal
thermal_zone0: failed to read out thermal zone (-61)"
#regzbot fix: thermal: core: Back off when polling thermal zones on errors
#regzbot monitor:
https://lore.kernel.org/all/2348857.ElGaqSPkdT@rjwysocki.net/


#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=219014
#regzbot resolve: invalid: kernel just grew, which triggered a u-boot bug

#regzbot report:
https://lore.kernel.org/all/87138377-d5b0-4c28-96bd-35a0ffd5f204@kernel.org/
#regzbot introduced: 8b2cb32cf0c613
#regzbot summary: drm/amd/display: secondary monitor does not to come up
at all

#regzbot report:
https://lore.kernel.org/regressions/172096805546.8.15772688283210394474.379370367@simplelogin.com/
#regzbot fix: x86/efistub: Revert to heap allocated boot_params for PE
entrypoint
#regzbot monitor:
https://lore.kernel.org/all/20240718205806.2888909-2-ardb+git@google.com/


#regzbot report:
https://lore.kernel.org/lkml/CABXGCsNptxsQO=5=qi-JYiFX=rX8Ok5inK80Gn0qrUFWbtBGng@mail.gmail.com/
#regzbot fix: drm/amd/display: fix corruption with high refresh rates on
DCN 3.0
#regzbot title: drm/amd: green flashing bar on top of screen


#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=218961
#regzbot fix: ASOC: SOF: Intel: hda-loader: only wait for HDaudio IOC
for IPC4 devices
