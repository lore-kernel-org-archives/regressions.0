Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0AC71726
	for <regressions@lists.linux.dev>; Tue, 26 Mar 2024 13:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711460259; cv=none; b=Ue1l5l+cehnKGw0FHTTNiiOyC/tBKFlbqylJfCoQFCRd5c2wXOq7qFPp0nxuAJybtarzlDNzsuqD7ZcdbMKVOT45PP3+J1PDCF0UVGMC+p2DV/sJ+J7S/SmsNQkjHwPWLPoT3dXHCri1Ol/uSApSVgJ/j/S6dctN6ZnQYjwF8yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711460259; c=relaxed/simple;
	bh=h60tFvj2/wNY4+Jdnt/8wU2izHvLtLRVjjICYsUPsyE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=D5FrAYzF2GdOl4fJDq5nmQFn8OfnQkp2h8ddgYuJIXk5ICOpHlcN5UpykPcF69lmytTRDremcjyHeFXNqSVXnR8Tc83FRRuFLxT+gZJbVBJlpgbl8afIuY8V7DQfM34wgFEWA5O/gM8dznEzNKv4ACJi9IiGgQzMJY6kmiTBRqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=OqqXQSpr; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="OqqXQSpr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:Reply-To:Subject:From:MIME-Version:Date:Message-ID:
	From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=h60tFvj2/wNY4+Jdnt/8wU2izHvLtLRVjjICYsUPsyE=; t=1711460256;
	x=1711892256; b=OqqXQSpr740ezNsqn/oQTj8S6/NI+kCbuydzvpnobxjR7atbeRuGbQ7NqA1GG
	jrfAtRvq1vbaWORvIpFmEQSuJS9Zxw+1e/epoCXDmzkCeXrNybfTLH+ax9lE+yNfvRwH14bH+/9je
	5syx1WslVLtIvtfSDQwaFHsqdn7roJU8GUF8vKr6z0YUZfEWgtu0m7DHNuCL/l6+XmXYSq990/bMj
	rvPIsvRXIZWuYM4WEVTCJ5W7ZwkCR47JyNjkEvLM0/l+PcnKhJ4cIbR9aoTvT8HwXKgBFksIphJ3N
	Pf9DqC7PpbEQd5ZaDjvZjLRIsNCtscWy8JqJ6PZ46kKftpD4pg==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1rp6zc-0000wx-Pv; Tue, 26 Mar 2024 14:37:32 +0100
Message-ID: <1431ec54-f22d-4f2f-9556-a1c217373741@leemhuis.info>
Date: Tue, 26 Mar 2024 14:37:32 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Subject: Re: Thread for updating minor properties of tracked regressions
 [consider ignoring it!]
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
To: Linux kernel regressions list <regressions@lists.linux.dev>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1711460256;a24c54a6;
X-HE-SMSGID: 1rp6zc-0000wx-Pv

On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/Zfv8iCL6CT2JqLIC@darkstar.users.ipa.redhat.com/
#regzbot introduced: 4a693ce65b18
#regzbot duplicate:
https://lore.kernel.org/all/4eeac1f733584855965a2ea62fa4da58@huawei.com/
#regzbot title: kdump/crash: crashkernel region on x86_64 can't be added
into iomem tree sometimes
#regzbot fix: crash: use macro to add crashk_res into iomem early for
specific arch
#regzbot monitor:
https://lore.kernel.org/all/20240324033513.1027427-1-bhe@redhat.com/

