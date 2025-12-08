Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68CF325498
	for <regressions@lists.linux.dev>; Mon,  8 Dec 2025 14:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765203985; cv=none; b=fvpwDUHS+Euve2UUYV6FBeAyGWpvZJqPOQKkCwFTxdKz7f0Fdm5r2+McKziZu0CaHv2E8P2dQ+MB2PmiyFE1yaDTtaxeFcdFuHz05Dg3Kwfo+maK4PKGgsrkLFDnl9RXt8Lr1T/N6gvNoMYYv7cYjg6czE83Bk+LlU1qu4DeP/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765203985; c=relaxed/simple;
	bh=nyK/xKWHRHTJWXdtfamVawLNlScVHTeLwUizHH79n0U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qXYLB6DVzJGywTrB+QUYMuOG7vxrVlsxgVyBErUsByVnAM02WqDBsHjg9uCN4b6gUol/E21mnOCcaHaBD9tZBgWFB/v4dqj01GZeyRAthT+MWcT3BfjwDrxJNLQg4BcIfKcDvwQyYSz8MqZmvd9mtotMu9PRoEyrK3n5Wv8tZeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=hmtrRO+S; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="hmtrRO+S"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=RsK+IJCNumVJ5861ZIVsf9EH4J2y+xty7CYVakdSvMc=; t=1765203983;
	x=1765635983; b=hmtrRO+Sr1Bw7zKlAATKFntpvTCchb3jlGpt3Fs49slhLSQKbJZ98musCrb0U
	Q05QdECHk92NlSYrEP7R3E7xaRdxcXAz0RvikeTCExL5JTSd056odfTOlJ0jzymobM5ymjApLDqNa
	eKsLegCia+2zPJUXmt6l3xDAMh7ReCHNStTBcNgJqmGp8d/2xgjcaM/gnWQLV5XUC/mdv5/QGhRsp
	XQe9lIjYKtiV6rMypeZ+saUFZoCH19WSWfFU9033u0c+NuNEsJTDyjXDHxzTN/bVE1Nl4egBkjfUa
	ssSA86Mb7Bv5DeRev/Gv0L9DNOvCaD1UpjdVl6tsJS+KIZm+NQ==;
Received: from [2a02:8108:8984:1d00:a0cf:1912:4be:477f]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	id 1vScBw-004T4W-2a;
	Mon, 08 Dec 2025 15:26:20 +0100
Message-ID: <f08fc7da-0d2d-4d7d-a1dc-8ed90493dac8@leemhuis.info>
Date: Mon, 8 Dec 2025 15:26:20 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] Display signal loss (blink) on input at >100Hz since
 v6.1 with AMD Graphics Card
To: Yash Anand <yashanands112@gmail.com>
Cc: regressions@lists.linux.dev, amd-gfx@lists.freedesktop.org
References: <CAKpMnw3=GYLxggX1cJMG99XbfxNg4vC5Qb+-VNzEhgFAxEoYRA@mail.gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <CAKpMnw3=GYLxggX1cJMG99XbfxNg4vC5Qb+-VNzEhgFAxEoYRA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1765203983;0f19e077;
X-HE-SMSGID: 1vScBw-004T4W-2a

Hi!

On 11/27/25 08:43, Yash Anand wrote:
> Hi, I'm Yash. I would like to report a regression I'm facing with my AMD
> graphics card (RX 6500XT) and its driver amdgpu. This is happening to me
> in ALL the kernel versions above 6.1, i.e, linux 6.1 is the last kernel
> tested by me in which I'm not facing this issue.

Thx for the report.

The problem is quite old and maybe nobody will take a closer look,
unless you find the change that broke things using a bisection – and
even then there is no guarantee that it will be fixed due to how long it
exists already.

Developers of the driver in question also expect bugs to be reported to
https://gitlab.freedesktop.org/drm/amd/-/issues , which might be why
nobody replied here yet.

So it's likely best if you report the problem there and ask for advice
first before investing time in a bisection.

Ciao, Thorsten


> The Issue:- Whenever the refresh rate is set above 100hz (the max
> refresh rate my monitor supports is 120hz), the screen /flickers/, or /
> blinks,/ i.e, it turns off for around 2s and turns back on whenever I
> click on things like- new tab button in firefox, type things in the
> terminal, press the super key, change the theme from appearance, etc. 
> 
> The system is responsive, but the display /flickers/ or /blinks /while
> doing normal tasks in my system. This doesn't happen at 100hz, or lower,
> like 60hz etc.
> 
> System Specifications:
> GPU: Powercolor AMD Radeon RX 6500XT 8gb
> CPU: Intel i3-9100f
> Monitor: Acer EK240Y G0 23.8 Inch IPS Full HD. I am using it at 1080p at
> 120hz. Connected through HDMI
> Distro: Manjaro with XFCE. Also tested with fedora, linux mint, and some
> more.
> 
> Last Working Kernel Version by my testing: Linux 6.1.153-1 LTS
> First Bad Kernel Version by my testing: Linux 6.6.107-1 LTS
> Also facing issues on the latest Linux 6.17.1-0
> 
> Please let me know if you need any specific logs and also the command to
> fetch it (I'm a beginner in terminal and its commands)
> 
> Thanks, 
> 
> Yash.
> #regzbot ^introduced: v6.1..v6.6
> 
> 

