Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14BD5788E
	for <regressions@lists.linux.dev>; Tue, 12 Mar 2024 10:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710239947; cv=none; b=b5lP4UUWTbeKEqa04U0wwKJG125c1jfGUsPE3fRfbJQV/wjGA2NF9szyOJNeFzJUBUcvThyJCYHm7YLNUk6riMjlvaDZkCxEKPmpzcrHy0Ah/EX4U1ldG7YkTKcRp/laVk6c/PJuOnDYaPjZievBxUs8t1DPojYhHH6l3vu1Y0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710239947; c=relaxed/simple;
	bh=B1n6Rj9ez4TXVKQVmjxXjRvjofuTzbqZwPRFlAo5bZg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=plO4mGvkDrGM0gPyLiLYyZOFaStSmk7ohrjaFO1Vp00GvgDMR/6RSwTbdyWFR4qdKqOFae5SLOmLeY6PYxhjAMjombv4ShdS/chF4IcfeCZ3mWecYPNmHYLoe1cehwJVu2/qxZ5x/xhF0pno23CHfcw7GH/qD9/qbZpJAtOloRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=T1OIhIie; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="T1OIhIie"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:
	From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=JAFW4O2K++MdQJ4AffGYxqtBHv2FmFmno9iyiD1PbYg=; t=1710239945;
	x=1710671945; b=T1OIhIieMOlXmKTpsc/oalh7D42VSsx/cWOappElhrBQA0+Q7H6ykSnPKCaP7
	aue3DNu14dQxCtEwh77ugmPnA8ciGaeTleMevRspUGp/YaE7rdVJ1ScsNikKeg/NUxgDTXm6gQHsa
	B94VU4qhmFuqyrIS3p2ebANKDeUGqinkfC4e62r9IIdTDWg1d8ywdTj3+Vv9LQasAzXRUq2855FfF
	1xlisOGk+7EQLTl3+mQ5sP2Tnzmo1jztmpZTVyGNTW+Qm9DcR32Nvs+6nDqxOS1WnJBxNKq7IXKEd
	cTDnT69T54k/qyaRilecNVmgVnW1Y+VyQMRly4y1wAnS8eowwA==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1rjzXC-0004Wc-JD; Tue, 12 Mar 2024 11:39:02 +0100
Message-ID: <91d8a6b6-6186-4aa0-8462-56b4751854e9@leemhuis.info>
Date: Tue, 12 Mar 2024 11:39:02 +0100
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
To: Dan Smolik <smolik@mydatex.cz>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <2ede8f49-41f8-4d9a-83e4-ea5d4d1677fe@mydatex.cz>
 <a2e64be0-e07d-4c55-aba7-87c7e4c876e0@leemhuis.info>
 <734cf096-3769-4610-b72f-394c31a8d942@mydatex.cz>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <734cf096-3769-4610-b72f-394c31a8d942@mydatex.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1710239945;4e4aa29e;
X-HE-SMSGID: 1rjzXC-0004Wc-JD

On 12.03.24 11:27, Dan Smolik wrote:
> 
> Dne 12. 03. 24 v 11:19 Linux regression tracking (Thorsten Leemhuis)
> napsal(a):
>> On 11.03.24 22:55, Daniel Smolik wrote:
>>> I have found problem with kernel > 5.4.271 (long term) on sama5d3. When
>>> I config can bus with:
>>>
>>> ip link set can0 type can bitrate 125000 triple-sampling on
>>>
>>> and type
>>> ifconfig can0 up
>>>
>>> prompt never returns and cannot run eg. ip a (never returns) existing
>>> ssh connection works but can´t do new one.
>>>
>>>
>>>    I have my own daughter  board with can bus driver MCP2515 connected
>>> over SPI bus. There is
>>> snippet of my DTB:
>>>
>>>   can0: can@0 {
>>>                                          compatible =
>>> "microchip,mcp2515";
>>>                                          reg = <0>;
>>>                                          clocks = <&can0_osc_fixed>;
>>>                                          interrupt-parent = <&pioD>;
>>>                                          interrupts = <29
>>> IRQ_TYPE_EDGE_RISING>;
>>>                                          spi-max-frequency = <10000000>;
>>>                                      };
>>>
>>> with this all working  perfect  on long term kernels 4.19.  I try switch
>>> to newer kernel and latest I get working is 5.4.271.   Kernel 5.5.0
>>> -5.5.6 I can´t  compile and 5.5.14  is affected with bug.
>> The two important question here are:
>>
>> * Is mainline (e.g. 6.8) affected as well? That determines if the
>> regular developers or the stable team has to look into this.
> 
> I mean yes,  I tested 6.6.21 and is affected.   6.8 I can test today
> afternoon.

Yes, please test 6.8.

>> * Could you bisect the problem (e.g. I assume between 5.4.271 and
>> 5.4.272)? I'm working on a guide that explains this:
>> https://www.leemhuis.info/files/misc/How%20to%20bisect%20a%20Linux%20kernel%20regression%20%e2%80%94%20The%20Linux%20Kernel%20documentation.html
> 
> Yes I try this but it looks like that latest good is 5.4.271 and first
> bad us 5.5.0  but this kernel fail when building to arm platform.  First
> which I build for arm is 5.5.14.
> 
> I try bisecting but when I can't build kernel what can I do ?

Bisect between 5.4 and 5.5 and during the bisection use "git cherry-pick
--no-commit <sha1sum>" to apply the fix(es) without committing them
before you build; once the build is ready, use "git reset --hard" to
reset things.

But please check 6.8 first; if it is affected we can CC a few
developers. If you are lucky they have an idea what might be wrong here
and then no bisection might be needed.

Ciao, Thorsten
