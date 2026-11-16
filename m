Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.68.61.103
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794835010;
	b=QwWQNwz1kPdoSZ9Pob6orEsTLrKBMOpJwOD2agzaxrfJRJ9ayl9Rr2CI5cDzkcyhgCl2
	 eJUTDHHbDj8ydEXamD4HBiOHhsE0gY0DTeN5/cutNj+d/pc+DmIAbrngDfX+esDAKHIEc
	 ikWJyhmCu0YJKeD99uqPPdXfMFMPKdeZIuI3edKiH7EydDZgX3xLE4OLcBzVmGzk30fIa
	 AiHgsV7NVdO9Y7/cLwJq+xnlVZ21Iv9FWaG7b6jHvbX6ihEFvj0Lz8nqI9+h1liVz+oT5
	 BELCosJd75qM3f7VOfXzxwTXbg9YORa+wJiG0AUZtqKZB4pO/QPz6U089Bt44PZTXIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794835010;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received-SPF:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:From:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-PPP-Message-ID:X-Rspamd-Server:
	 X-Rspamd-Queue-Id:X-NC-CID;
	bh=hLeEYeSQsdOJFhziWzm1Zzf90TVQsJyc7BGUihiqPBM=;
	b=n+RlWToeLwnmF53hFrHejJzvo0vj6EDrBqieu4hDBG38SPJR0N3LavEPKRFAXHAQuUVb
	 KolIFO2j7LTMa2ii/betngeWhy+k/7+NDc5NEsGDflq8isQxV37FwmIK/Po/OlxF7iM7T
	 IHBxGcd5GwvKIhSEhDzzmgTjhIvGiqdO92zfdTERori9kXruAgHjVQ8BLsIMPcspzkW1e
	 UQ8gag3vR0tIg2WLaCxkjATp+Tr8SnjGCrL3kLVo3nPORu43WDUgGmAZBGKfZq27Srcbb
	 /Yg7iiHNcyFj3fhpUx8kEwxA4g56zG+opyUQWlj6pc3uRrg30dEVHVtnFqyRuT7WbYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leemhuis.info;
	spf=pass smtp.mailfrom=leemhuis.info;
	dkim=pass header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=QnXUv5Xb;
	arc=none smtp.remote-ip=188.68.61.103
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.61.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD86606A32C
	for <regressions@lists.linux.dev>; Mon, 16 Nov 2026 13:16:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DD86606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=QnXUv5Xb
Received: from mors-relay-8403.netcup.net (localhost [127.0.0.1])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4jSpC40FRhz88SY;
	Mon, 16 Nov 2026 14:10:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1794834656;
	bh=2TxI9+SGe0sHxbIUvAhIfB1CrhLPpO7iBEfQOzLxbNU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QnXUv5XbKULYwiSBGL44LOV4A/cW1X/t9E26L1U0bEezgR3kvZ9WHB+qkXbgEbBOe
	 2oe3Mmk2/t4zkb5QaKK01qK1B9Q62h/mOP7lWv63TJdGr9RarWIVP/RejdBTtb++jw
	 +z6l+XZ9b9NoVXnqnsl4tUyqI5y+0dZhTj6M1Ho4o/AdQnxGQTKsR8rgr/fqdYrc7U
	 t2GdOehEdKHDobzNLgFD2srIFLuVlvrtzsUmoZnt1byJCd5LwoxlM3zwJ/eQcyrAk6
	 FyVXWLU/MpiK8qHkyGomlqGXsojMv69d0GZZ83UGgBweiTMI7vxLcAzATmz4xdMXXG
	 KNKz+zDRLujWg==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4jSp9d1wQ2z88yF;
	Mon, 16 Nov 2026 14:09:41 +0100 (CET)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4jSp9C55bNz8tKY;
	Mon, 16 Nov 2026 14:09:19 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id E405F5FA96;
	Mon, 16 Nov 2026 14:09:14 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <340e5fc5-4b9e-4b29-a53a-cb7702858997@leemhuis.info>
Date: Mon, 16 Nov 2026 14:09:14 +0100
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
Subject: Re: [REGRESSION] iwlwifi IO_PAGE_FAULT and Master Disable Timed Out
To: HyeongJun An <sammiee5311@gmail.com>,
 "Korenblit, Miriam Rachel" <miriam.rachel.korenblit@intel.com>
Cc: Chris Bainbridge <chris.bainbridge@gmail.com>,
 "Grumbach, Emmanuel" <emmanuel.grumbach@intel.com>,
 "Berg, Johannes" <johannes.berg@intel.com>, linux-wireless@vger.kernel.org,
 regressions@lists.linux.dev
References: <amzVtgQb2p-_nShU@debian.local>
 <DS0PR11MB78800B96A0FE637DC5390E4AA3D62@DS0PR11MB7880.namprd11.prod.outlook.com>
 <e320fab5-d4d4-40fd-b032-d64554e5c0b0@leemhuis.info>
 <20261113080830.1459856-1-sammiee5311@gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <20261113080830.1459856-1-sammiee5311@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <179483455533.1110648.8436113547868285335@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: E405F5FA96
X-NC-CID: 8foajYi4Klc2JC9F7J5k//o7f+WNeI9nKzd0kquhizoTVtZHNKQ=



On 11/13/26 09:08, HyeongJun An wrote:
> Hello Miri,
> 
> The same happens on a Dell Latitude 9420 (Intel AX210, firmware
> 89.123cf747.0) with Intel VT-d, on 7.4-rc1. It shows up when iwlwifi
> stops the device, on driver unload and also once at probe and once on
> suspend entry:
> 
>   DMAR: [DMA Read NO_PASID] Request device [0000:a4:00.0] fault addr 0xfd8ed000 [fault reason 0x06] PTE Read access is not set
>   iwlwifi 0000:a4:00.0: Master Disable Timed Out, 100 usec
> 
> ty-a0-gf-a0-89.ucode has the TLV version 0x00000059, so
> IWL_UCODE_MAJOR() gives 0 and the "<= 77" check turns the reset
> handshake off.
> 
> Your "wifi: iwlwifi: mvm: properly check the FW version" fixes the
> unload case here. Unloading and reloading iwlmvm and iwlwifi 50 times:
> 
>   without the patch: 18 of 50 unloads hit the fault and the timeout
>   with the patch:     0 of 50
> 
> Tested-by: HyeongJun An <sammiee5311@gmail.com>

Just to be sure everybody is aware of it: Miri meanwhile afaics
submitted the fix here:

wifi: iwlwifi: mvm: correctly check the API version
https://lore.kernel.org/all/20261114193144.ab54bc9717fc.I8cda260e2ef7aedd790915a17cb6832010f82aa4@changeid/

HyeongJun An: your Tested-by wasn't included, so might be worth
resubmitting it there again as a reply.

Ciao, Thorsten

> I could not find the patch in next-20261112 or in the wireless trees
> yet. The check also went to 6.18.y as 9dca67624721.
> 
> I ran these with Claude Code (Claude Opus 5.5).
> 
> Best regards,
> HyeongJun An

