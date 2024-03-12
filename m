Received: from kali.sitour.cz (smtp.sitour.cz [77.48.244.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3677866A
	for <regressions@lists.linux.dev>; Tue, 12 Mar 2024 10:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.48.244.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710239236; cv=none; b=PUiWuy3wiwTTSeNhmiiOF+JwCGZw4Vi4AcE51YJwDEHCuHISe55B3QYUl5bOw4wk29uDzoJ61u8N7wA5mmReANplu1S+rU6aGJZsltPasSKEwbd20Jv06M9MFTATkQM/c14rOaL2eT47PvGLWdPeAup2TT01Q14TW/2cO3i2FOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710239236; c=relaxed/simple;
	bh=UPfC/b8FvsGLU5u1fhkn1c5cBnzVNPcP+Rw5HpNQe6s=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=HmcsxOrrWSV6+3wt4o1XDAgkxlXWwXrUclyWkN0PUGql9rDgX3JbRtDsSM+5n+ctbA5Uf/5nkzPTQKEhO5Mo93uPH+B8WoPWy8i0DQF3Y2FDzt9Ccwntx8XJr+/K8k2hPb/ZVlwco2XyDEd42gRLwkb+t+TSdE9ZPUYN7dYFokY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mydatex.cz; spf=pass smtp.mailfrom=mydatex.cz; dkim=pass (2048-bit key) header.d=mydatex.cz header.i=@mydatex.cz header.b=hP8q8gMO; arc=none smtp.client-ip=77.48.244.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mydatex.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mydatex.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mydatex.cz header.i=@mydatex.cz header.b="hP8q8gMO"
Received: from localhost (localhost [127.0.0.1])
	by kali.sitour.cz (Postfix) with ESMTP id BA9074E0272;
	Tue, 12 Mar 2024 11:27:05 +0100 (CET)
X-Virus-Scanned: Debian amavis at sitour.cz
Received: from kali.sitour.cz ([127.0.0.1])
 by localhost (sitour.cz [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tMbe17dJEAlS; Tue, 12 Mar 2024 11:27:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mydatex.cz; s=mydatex;
	t=1710239225; bh=UPfC/b8FvsGLU5u1fhkn1c5cBnzVNPcP+Rw5HpNQe6s=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=hP8q8gMOrrKwblG2PL5oMysMWAl9ZsEP2r+HAiObRlXgyTQwgmf2AM1G2DiSLkqC3
	 d/zAOsoYPPvY+hAuQG83uACwtgTsCYk0G0GumVDivJPh3FQo77PPx824z0eXlZsnsA
	 Yj0eTVWdVgV8hFpqCl4EZPB4hUuw9Hno81ZfHlflH8gHqB4dhKKnGCMyT2c0LFoPlz
	 d8tddWhsmHusu0IYj44mgTZfHFf5RC7BzCCzRENNUmTPEUDKeom5zUPKgWMdSPqn+R
	 gJ2iliNNUbWQzGvn3T/KAYdtRhrPBYGBivIWAZ1auhtD2wKPEnDPSxZdFvF/jlS43x
	 dFqRYUcF5Y7sg==
Received: from lavockin.sitour.cz (lavockin.sitour.cz [192.168.127.202])
	by kali.sitour.cz (Postfix) with ESMTPS id 5EAF24E0271;
	Tue, 12 Mar 2024 11:27:05 +0100 (CET)
Received: from [192.168.127.19] (zenta.sitour.cz [192.168.127.19])
	by lavockin.sitour.cz (Postfix) with ESMTPSA id 410F9480BCC;
	Tue, 12 Mar 2024 11:27:05 +0100 (CET)
Message-ID: <734cf096-3769-4610-b72f-394c31a8d942@mydatex.cz>
Date: Tue, 12 Mar 2024 11:27:04 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regressions can bus with MCP2515 on sama5d3 connected over SPI
 stop working on kernel > 5.4.271
To: Linux regressions mailing list <regressions@lists.linux.dev>,
 regressions@leemhuis.info
References: <2ede8f49-41f8-4d9a-83e4-ea5d4d1677fe@mydatex.cz>
 <a2e64be0-e07d-4c55-aba7-87c7e4c876e0@leemhuis.info>
Content-Language: en-US
From: Dan Smolik <smolik@mydatex.cz>
In-Reply-To: <a2e64be0-e07d-4c55-aba7-87c7e4c876e0@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Dne 12. 03. 24 v 11:19 Linux regression tracking (Thorsten Leemhuis) 
napsal(a):
> Hi! Thx for your report!
>
> On 11.03.24 22:55, Daniel Smolik wrote:
>> I have found problem with kernel > 5.4.271 (long term) on sama5d3. When
>> I config can bus with:
>>
>> ip link set can0 type can bitrate 125000 triple-sampling on
>>
>> and type
>> ifconfig can0 up
>>
>> prompt never returns and cannot run eg. ip a (never returns) existing
>> ssh connection works but can´t do new one.
>>
>>
>>    I have my own daughter  board with can bus driver MCP2515 connected
>> over SPI bus. There is
>> snippet of my DTB:
>>
>>   can0: can@0 {
>>                                          compatible = "microchip,mcp2515";
>>                                          reg = <0>;
>>                                          clocks = <&can0_osc_fixed>;
>>                                          interrupt-parent = <&pioD>;
>>                                          interrupts = <29
>> IRQ_TYPE_EDGE_RISING>;
>>                                          spi-max-frequency = <10000000>;
>>                                      };
>>
>> with this all working  perfect  on long term kernels 4.19.  I try switch
>> to newer kernel and latest I get working is 5.4.271.   Kernel 5.5.0
>> -5.5.6 I can´t  compile and 5.5.14  is affected with bug.
> The two important question here are:
>
> * Is mainline (e.g. 6.8) affected as well? That determines if the
> regular developers or the stable team has to look into this.

I mean yes,  I tested 6.6.21 and is affected.   6.8 I can test today 
afternoon.

> * Could you bisect the problem (e.g. I assume between 5.4.271 and
> 5.4.272)? I'm working on a guide that explains this:
> https://www.leemhuis.info/files/misc/How%20to%20bisect%20a%20Linux%20kernel%20regression%20%e2%80%94%20The%20Linux%20Kernel%20documentation.html

Yes I try this but it looks like that latest good is 5.4.271 and first 
bad us 5.5.0  but this kernel fail when building to arm platform.  First 
which I build for arm is 5.5.14.

I try bisecting but when I can't build kernel what can I do ?

Regards Dan




>
> Ciao, Thorsten
