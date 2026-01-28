Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4838274B51
	for <regressions@lists.linux.dev>; Wed, 28 Jan 2026 10:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769596868; cv=none; b=V+rZcfarff0280A9zm4QzIXKf3wJ+GoosZZKogEoqMPKSWJ8puJUz03ntFmRq7irmAAiBPxZVSHj86NaQp20aoH/h8UrLE6TwS4yJbmwfLEWy5cO9QTXkNN7iDsZ3rysm76x1doa4XgYrncxjL8l8ymZDtd+Gn5isJSNY6wlvV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769596868; c=relaxed/simple;
	bh=eFc0VbFLCjD2TrgzMMdJox0BAZQzUNfnY4sWOQSC6rA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=IRxIgDCdliO8tBYbV0TcjjJk29PWUbAx8GfcxTFb9037jnbRwxh+2Idudg5toGHjKA8uwmW6rHlpmNI5kcw4uvZ1eE+W/houPBE7jUSgx7CelaA/eyjS+pG4305MQfOBStCMYyZD8x6V/RVW0NdkOtKFlAY1y/wkQBwTyDUXyS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=up8GV93C; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="up8GV93C"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:Subject:From:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=eFc0VbFLCjD2TrgzMMdJox0BAZQzUNfnY4sWOQSC6rA=; t=1769596866;
	x=1770028866; b=up8GV93C0JSZctr0Qolf4acbbiVNftKkxMGbjJM1RbET8IWWcTdWqaJ5UKPvL
	P5x3/JRQ/M8aQafyrmG3maW8g76ieralXlN4v/oWsnDf89LMyjLqOQ7xCeHImQ0vtyxdrEMiP413x
	bvNatsgU749LlkDYa4RAWqF+Xv+iTwWk34sIE4AxPk7jMeTTshw3JCBNzx7yrwlJ0fqBJy6QNjnMR
	l0Dwymu3AEHjutJPB7MiIachfEICDxeAUszyBpx81vAxKUMu425cFDrNUPm5YyKJS7QDEcZU9S4v1
	PbJNQdMYw4f/n1a+ypVQ1eVGW3n3YcDXH4FhHDIX+b8ARmBpWA==;
Received: from [2a02:8108:8984:1d00:a0cf:1912:4be:477f]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	id 1vl2yo-002qHi-2I;
	Wed, 28 Jan 2026 11:40:58 +0100
Message-ID: <7dbc5433-170b-4e95-8a8c-5a71dc1542a6@leemhuis.info>
Date: Wed, 28 Jan 2026 11:40:58 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: Thread for updating minor properties of tracked regressions
 [consider ignoring it!]
To: Linux kernel regressions list <regressions@lists.linux.dev>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1769596866;edf736aa;
X-HE-SMSGID: 1vl2yo-002qHi-2I



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/stable/aWqmDHdHVLs5M3HQ@eldamar.lan/
#regzbot fix: powerpc/64s/radix/kfence: map __kfence_pool at page
granularity

#regzbot report:
https://lore.kernel.org/all/CAJZ5v0gkhSxWZ9wTY%2B2AGDCtZgSKmOwpg7Np9OVDMJptqnntUQ@mail.gmail.com/
#regzbot introduced: 436326bc525d
#regzbot title: objtool: Build breakage (undefined references)
#regzbot fix:objtool: fix libopcodes linking with static libraries


#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=220954
#regzbot introduced: 3c7bf5af2196087f394f9099b53e37569636b259
#regzbot title: e1000e: PC10 in runtime idle in newer systems prevented
#regzbot fix: e1000e: reconfigure PLL clock gate value and re-enable K1
on Meteor Lake


