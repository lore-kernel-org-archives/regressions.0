Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.233
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793108706;
	b=BA/XKH1ZUfCe5cWpHk7GzLeG1NuGbVh6UknZqW57Ytt3cr0Ctqr4/FJc8vJ3FdgMdm0a
	 Yi+COxloLw2iA1bVv0IV0bLTwpaNuZPGuAnYxq+xfD8wzggJimArWm9jgyH/+a80+hSVO
	 o7Aj7sRJ/Igf0pWpV1xlnEOCcuiufGGiMUCtzczehJBy/zwm8YLWCDkRwbNcbL1iDqG13
	 zxsB6lIoE8crWX3RqYvuByt/fjO9qN8Kj/ckWPMc6tkQMd90YP1Dcy+lA4HkIStMI5vHI
	 Gu7OsIZfdP0/84OfVy1ptTmilLP7JYeaw7AD5gNtRNEoaFuia/OE/iN0rtnIEHG0auQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793108706;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=+zgFas+4hJZZwgPEJMUzFoGVQwC5WpjC0swXnGqt0W0=;
	b=fa/N+Y75WkTBOLVE1GqDujAilyMF9UVkKGwHvgbIW3qizUTeYlzX4vTVlWFeDZ+OlLW6
	 auzdYtsJSbAaMXNrKKxQWZcWdxhVudn8wMR+btLlLnvB6Mk6pHUOnFpqoYH0kRT+CCuRy
	 7FG9XAPF8OicAPcwOU8ciUoSZpMnMaURlKUm43sYGKHzpdIAfWKoE0Sfozx3qus+/hjSY
	 soRbva/BxlBGP3Sbu3SiXsY4M34UPIBgNkRSb3VY7J0FGAS35eDr/cnBZJKlG8sdTpWQ6
	 0VEsZ8Hl9a6HD1A69ot47xb53lp0tGV9JhBMsI/pETJB801Q8QDqZ8l9s1rFWbxuX+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=QwXr001w;
	arc=none smtp.remote-ip=91.218.175.233
Received: from mta0.migadu.com (out-233.mta0.migadu.com [91.218.175.233])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E63606A321
	for <regressions@lists.linux.dev>; Tue, 27 Oct 2026 13:45:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42E63606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=QwXr001w
X-Envelope-To: regressions@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=aWAzItW6Ln/bOAVvVXsGvaelikw5SSSjsKUtt55BHao=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793108704; v=1; x=1793713504;
 b=QwXr001w6nn/Q+IYZqN6lAH940OXJ15yslwhMkAmfiRCXHN0pJaNCXr1F+MD/i9VM0ysKIqP
 IDd1JsKgoBOJMzJKsOawuVESspuHJdNoIqsNdUxNXoVrrTFbAFSsaGMGNu8iNPBCTf3+6qkpL29
 iX9PIrAHBm/x7ONwBh6bwbS0=
X-Envelope-To: regressions@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 17da54f9e5b41fb1;
	Tue, 27 Oct 2026 13:45:03 +0000
X-Mizu-Trace-ID: 17da54f9e5b41fb1
X-Migadu-Flow: FLOW_OUT
Message-ID: <f5c6c08f-2978-4c45-b8e3-91f0509b459f@linux.dev>
Date: Tue, 27 Oct 2026 21:44:53 +0800
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 2/2] Revert "net: advertise TCP MSS from the
 configured MTU, not the learned PMTU"
To: Esko Mobius <echoowall@gmail.com>, Eric Dumazet <edumazet@kernel.org>
Cc: netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 Simon Horman <horms@kernel.org>, David Ahern <dsahern@kernel.org>,
 Ido Schimmel <idosch@nvidia.com>, Shuah Khan <shuah@kernel.org>,
 Thorsten Leemhuis <regressions@leemhuis.info>, regressions@lists.linux.dev,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20261026-advmss-revert-v1-0-272fa4b7ecb6@gmail.com>
 <20261026-advmss-revert-v1-2-272fa4b7ecb6@gmail.com>
 <e25fd292-5391-41fc-a324-0ec260828415@linux.dev>
 <CAL4Wiip=TkP2hmOFR-1Y-CU4rYHY_q=TBDhK6RmTj9UEMQ95Gw@mail.gmail.com>
 <D438C59D-09D4-4008-9240-18DA0ABBDCEA@gmail.com>
From: Jiayuan Chen <jiayuan.chen@linux.dev>
In-Reply-To: <D438C59D-09D4-4008-9240-18DA0ABBDCEA@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/27/26 9:12 PM, Esko Mobius wrote:
> On 10/27/26 1:45 PM, Jiayuan Chen wrote:
>> This precondition does all the work. The server only learns the PMTU
>> when it sends a full-size segment itself. [...]
>>
>> Please re-run the 6.12.107 case without seeding the PMTU.
> You are right. Without seeding, 6.12.107 stalls the same way:
>
>    kernel        PMTU seeded   SYN-ACK MSS   1 MB upload
>    6.12.107      no            1460          stalls
>    6.12.107      yes (ping)    1416          OK
>
> My reproducer took a shortcut there. What it should have modelled is
> our production setup, which is the masquerading relay you describe:
> the clients share the relay's address, so ordinary downloads by other
> clients keep the server's PMTU entry fresh. Modelling that directly,
> with no artificial seeding (cliA downloads 1 MB, then cliB, behind a
> firewall dropping frag-needed, uploads 1 MB through the same relay):
>
>    kernel        SYN-ACK MSS to cliB   cliB upload
>    6.12.107      1416                  OK
>    6.12.111      1460                  stalls


Thanks Esko for the testing, and Eric for the explanation. Agreed.


> So I agree it was never a designed mechanism, it is the side effect
> Eric describes. We have since added MSS clamping on our relays.
>
> If it helps, I can send a v2 that describes the masquerading case
> instead of the seeded one in the changelog. And I am happy to test
> the net-next follow-up on this setup.


No need for a v2 from my side, I just wanted to confirm the actual scenario.

I saw your report earlier but was swamped and could not get to it in 
time, sorry about that.


Reviewed-by: Jiayuan Chen <jiayuan.chen@linux.dev>

>
> Thanks,
> Esko
