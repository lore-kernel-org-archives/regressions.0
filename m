Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8037AD53
	for <regressions@lists.linux.dev>; Tue, 12 Mar 2024 10:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710238784; cv=none; b=EXps9s+9h9YkHLQsRcdP2ZljbQhVLKSIElbI/QTq1kBPjTOs9beDYagzGW8rlx+fEdH3c7/fe3Fqnd0ju77ciZpbM9+tmMmomZVJyrTfzuT0YQkTowBQ5CXQ6dIMAU/uEJVn5wjs9FyiaDPS0JnaKihuTd0rwrrLa5+KR2KrzNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710238784; c=relaxed/simple;
	bh=2jRR5s95GR4MsJUqkHyWhA3osiEG1gZfLf7H3mA/gPg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=uH8CpuCNhigvsQg7H7Dpp3zFuAWmc/+Cti1bvqmghM70fvJt9lTpiVYFn3LXqPBJOfRYAHJ6PO5Q1AMsa4vGlMsvm9SN91lt1eR8d7scskIHmjWlJ6lnZf3Xg3Hjeig7X9WmC6crD13xcXNl3KV2AHftvQxR6hk4vrUfFhXu/8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=PoZ3J0Yr; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="PoZ3J0Yr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:
	From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=hvar/bvqJ7wRyu6kdBUowOA2qCxT+wguOpd/71s3XqM=; t=1710238781;
	x=1710670781; b=PoZ3J0YrtmoWmjq9iPfxP/6P5WOBvPuINWYss3gVNCus+QBkW9vQPJz+c+J9W
	t09kXa69vtGp7vU1nj3Cjf0nemXq6trd73T7yc8ekICKlYu1zH39+OhJ3U9jyX5GpWhEtwjww8+ML
	4s9P0yAffNNEG9ELuurqU5xfXtW95L0e9vmXRMznPi4euS4i+gQyY40VGgXmWGCW3k+bTqE0f67Zc
	jZjtB3+M8qh02TLOek/Yuu810v/SzjUkfhDav+UddBPMKfTkESS3KWcagO5V428V0KJm9dC7j2KcI
	NeYyuMd3pSdzUQ7jyWGY6badubHcnawYKk8IWV1m9Giypp4aqw==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1rjzER-0002Xu-Hh; Tue, 12 Mar 2024 11:19:39 +0100
Message-ID: <a2e64be0-e07d-4c55-aba7-87c7e4c876e0@leemhuis.info>
Date: Tue, 12 Mar 2024 11:19:37 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regressions can bus with MCP2515 on sama5d3 connected over SPI
 stop working on kernel > 5.4.271
Content-Language: en-US, de-DE
To: Daniel Smolik <smolik@mydatex.cz>, regressions@lists.linux.dev
References: <2ede8f49-41f8-4d9a-83e4-ea5d4d1677fe@mydatex.cz>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <2ede8f49-41f8-4d9a-83e4-ea5d4d1677fe@mydatex.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1710238781;87c18cd6;
X-HE-SMSGID: 1rjzER-0002Xu-Hh

Hi! Thx for your report!

On 11.03.24 22:55, Daniel Smolik wrote:
> I have found problem with kernel > 5.4.271 (long term) on sama5d3. When
> I config can bus with:
> 
> ip link set can0 type can bitrate 125000 triple-sampling on
> 
> and type
> ifconfig can0 up
> 
> prompt never returns and cannot run eg. ip a (never returns) existing
> ssh connection works but can´t do new one.
> 
> 
>   I have my own daughter  board with can bus driver MCP2515 connected
> over SPI bus. There is
> snippet of my DTB:
> 
>  can0: can@0 {
>                                         compatible = "microchip,mcp2515";
>                                         reg = <0>;
>                                         clocks = <&can0_osc_fixed>;
>                                         interrupt-parent = <&pioD>;
>                                         interrupts = <29
> IRQ_TYPE_EDGE_RISING>;
>                                         spi-max-frequency = <10000000>;
>                                     };
> 
> with this all working  perfect  on long term kernels 4.19.  I try switch
> to newer kernel and latest I get working is 5.4.271.   Kernel 5.5.0
> -5.5.6 I can´t  compile and 5.5.14  is affected with bug.

The two important question here are:

* Is mainline (e.g. 6.8) affected as well? That determines if the
regular developers or the stable team has to look into this.

* Could you bisect the problem (e.g. I assume between 5.4.271 and
5.4.272)? I'm working on a guide that explains this:
https://www.leemhuis.info/files/misc/How%20to%20bisect%20a%20Linux%20kernel%20regression%20%e2%80%94%20The%20Linux%20Kernel%20documentation.html

Ciao, Thorsten
