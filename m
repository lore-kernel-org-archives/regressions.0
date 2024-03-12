Received: from kali.sitour.cz (smtp.sitour.cz [77.48.244.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43E3142648
	for <regressions@lists.linux.dev>; Tue, 12 Mar 2024 19:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.48.244.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710273443; cv=none; b=hslK3XT2G56n7riGy0hfXNogOyCZGotYCU13/wH0+LPm6gYkCEh7T2fPBxz8U70Ez/Tl+KE3Shgfi+EUTuukOFYObo8ZOi23rIFmvEeR97VMPsMd5ato5kJuYDnbquIV6ouqL1VD6hHbGpOt9ZRrhbmP+Mh7FiCsAHwZ5sLGfeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710273443; c=relaxed/simple;
	bh=GUrmdKnweXO/sLu3wA3GMFNaFVHLS8AhG3rvVMW+K7s=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=NoxuFhNvD9TQzEL7mAxmf9DqiRE8AZFR1BGdck6S1WFQfX2ZN475/uSphpTjoIHO53zv3UxBvWLuCR++FGc0mnavv384EF5gcwGTxEhma4bTCGi29nxlqD42dfvwttAEzeJziFHXFdyF3R5tRc7ZuwnBSBfgzbVaTXFUsv3koTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mydatex.cz; spf=pass smtp.mailfrom=mydatex.cz; dkim=pass (2048-bit key) header.d=mydatex.cz header.i=@mydatex.cz header.b=HUQjQN33; arc=none smtp.client-ip=77.48.244.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mydatex.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mydatex.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mydatex.cz header.i=@mydatex.cz header.b="HUQjQN33"
Received: from localhost (localhost [127.0.0.1])
	by kali.sitour.cz (Postfix) with ESMTP id 7344E4E0275
	for <regressions@lists.linux.dev>; Tue, 12 Mar 2024 20:57:13 +0100 (CET)
X-Virus-Scanned: Debian amavis at sitour.cz
Received: from kali.sitour.cz ([127.0.0.1])
 by localhost (sitour.cz [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qGmp8JfGJN3P for <regressions@lists.linux.dev>;
 Tue, 12 Mar 2024 20:57:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mydatex.cz; s=mydatex;
	t=1710273430; bh=GUrmdKnweXO/sLu3wA3GMFNaFVHLS8AhG3rvVMW+K7s=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=HUQjQN33PxJdfyAw9o/IFgCCz5qGT1CU4k0/kXntrrJmublbXmo2fVVSmvEkIt00x
	 J0xlrc80kUdkr+q2rvmSl4IYSKHdYO5vpuaCAwqRRioTeUTqP+1qiB6YPMFnilMX6H
	 i03wnie6lqbG3H/eXd396s9ygEHVKry32PnPCHym1IldmD6fDI7Px7jI+IVfskhDye
	 AbosF4wikSq3uzEHLcO77hZSKC21r6gzaURLih76k9ISqC6o5ZTjvXsFk9zBMlGhm0
	 5wwUNU8SaLY7QDZ1N5pCEraENgaQDZU0sIfZa8sEDykskbuCWTd4MlbAFLcOp06cFm
	 jXg7W6+Q0mhhQ==
Received: from [192.168.3.13] (firma.mydatex.cz [84.242.99.246])
	by kali.sitour.cz (Postfix) with ESMTPSA id D7D444E0272
	for <regressions@lists.linux.dev>; Tue, 12 Mar 2024 20:57:10 +0100 (CET)
Message-ID: <6918321b-038d-40b9-8149-d535bf9d3d52@mydatex.cz>
Date: Tue, 12 Mar 2024 20:57:10 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regressions can bus with MCP2515 on sama5d3 connected over SPI
 stop working on kernel > 5.4.271
Content-Language: cs-CZ, en-US
To: Linux regressions mailing list <regressions@lists.linux.dev>
References: <2ede8f49-41f8-4d9a-83e4-ea5d4d1677fe@mydatex.cz>
 <a2e64be0-e07d-4c55-aba7-87c7e4c876e0@leemhuis.info>
 <734cf096-3769-4610-b72f-394c31a8d942@mydatex.cz>
 <91d8a6b6-6186-4aa0-8462-56b4751854e9@leemhuis.info>
From: Daniel Smolik <smolik@mydatex.cz>
In-Reply-To: <91d8a6b6-6186-4aa0-8462-56b4751854e9@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi ,
6.8  is affected   with this bug.  I try bisect the bug.

Regards
             Dan

Dne 12. 03. 24 v 11:39 Linux regression tracking (Thorsten Leemhuis) 
napsal(a):
> On 12.03.24 11:27, Dan Smolik wrote:
>> Dne 12. 03. 24 v 11:19 Linux regression tracking (Thorsten Leemhuis)
>> napsal(a):
>>> On 11.03.24 22:55, Daniel Smolik wrote:
>>>> I have found problem with kernel > 5.4.271 (long term) on sama5d3. When
>>>> I config can bus with:
>>>>
>>>> ip link set can0 type can bitrate 125000 triple-sampling on
>>>>
>>>> and type
>>>> ifconfig can0 up
>>>>
>>>> prompt never returns and cannot run eg. ip a (never returns) existing
>>>> ssh connection works but can´t do new one.
>>>>
>>>>
>>>>     I have my own daughter  board with can bus driver MCP2515 connected
>>>> over SPI bus. There is
>>>> snippet of my DTB:
>>>>
>>>>    can0: can@0 {
>>>>                                           compatible =
>>>> "microchip,mcp2515";
>>>>                                           reg = <0>;
>>>>                                           clocks = <&can0_osc_fixed>;
>>>>                                           interrupt-parent = <&pioD>;
>>>>                                           interrupts = <29
>>>> IRQ_TYPE_EDGE_RISING>;
>>>>                                           spi-max-frequency = <10000000>;
>>>>                                       };
>>>>
>>>> with this all working  perfect  on long term kernels 4.19.  I try switch
>>>> to newer kernel and latest I get working is 5.4.271.   Kernel 5.5.0
>>>> -5.5.6 I can´t  compile and 5.5.14  is affected with bug.
>>> The two important question here are:
>>>
>>> * Is mainline (e.g. 6.8) affected as well? That determines if the
>>> regular developers or the stable team has to look into this.
>> I mean yes,  I tested 6.6.21 and is affected.   6.8 I can test today
>> afternoon.
> Yes, please test 6.8.
>
>>> * Could you bisect the problem (e.g. I assume between 5.4.271 and
>>> 5.4.272)? I'm working on a guide that explains this:
>>> https://www.leemhuis.info/files/misc/How%20to%20bisect%20a%20Linux%20kernel%20regression%20%e2%80%94%20The%20Linux%20Kernel%20documentation.html
>> Yes I try this but it looks like that latest good is 5.4.271 and first
>> bad us 5.5.0  but this kernel fail when building to arm platform.  First
>> which I build for arm is 5.5.14.
>>
>> I try bisecting but when I can't build kernel what can I do ?
> Bisect between 5.4 and 5.5 and during the bisection use "git cherry-pick
> --no-commit <sha1sum>" to apply the fix(es) without committing them
> before you build; once the build is ready, use "git reset --hard" to
> reset things.
>
> But please check 6.8 first; if it is affected we can CC a few
> developers. If you are lucky they have an idea what might be wrong here
> and then no bisection might be needed.
>
> Ciao, Thorsten

