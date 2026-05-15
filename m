Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [185.244.194.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6021B47DD5C
	for <regressions@lists.linux.dev>; Fri, 15 May 2026 12:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.244.194.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778847228; cv=none; b=rP19OXnYI9ZNOxC7p+21VXfV8VZRgJuRGu+9oXG4gpyp9uLq4gfCSxrMdb1+eWae14tN6S+Gb+yNhSBapkPD9suNMdPJt7hnZFfMeQ120j8EKFErvXFWDzY/gnwvlh17Btw9Q/jeE2SWLkufvQLdbAt2bp9sZk7M00TuMnTBFa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778847228; c=relaxed/simple;
	bh=FPI47REHeyJIL+zd6IEgpY5YNqGDRHwPcuF86v/SVuY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=ciexhNxREXXVt+Th1RcRhE3eNXzH0Z+MUp4N7XCP6gH0hIdsZc0ywNOtodU4x/mQB4ufUjNseOFXc3sQUg9idWHrTQNa/C67E2oxuexh5m8odDpWhwVVtymGzuKV4rnh98e+jzQTWFXkcTSy3lzEatc3MbH4sla6mmcJOLmxlYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=EtaZbf5+; arc=none smtp.client-ip=185.244.194.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="EtaZbf5+"
Received: from relay01-mors.netcup.net (localhost [127.0.0.1])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4gH5hK5WV0z984G;
	Fri, 15 May 2026 14:13:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1778847217;
	bh=FPI47REHeyJIL+zd6IEgpY5YNqGDRHwPcuF86v/SVuY=;
	h=Date:Subject:To:References:From:Cc:In-Reply-To:From;
	b=EtaZbf5+3bYFjBtOovLhMhol2wKU1LoDWI8oBLzZ5ICNVh29kyHHXYMkLywlMfOlN
	 OcbsKyi/PZFU4qouCUcn+6y/tqgsm1Zca9jmVLPYuV5CIOPz3k/FJ3obTbVK4Fk+FE
	 GG4gTaKSv4Lbhwyrxlv7DCVKx/cYTh0iQIFQ4edMtlVEewb8B+KHGP/rjeuTL+XM+v
	 QrNSPPIA0Rq1Hj6DG5n5zH0d3hqU+NFDP6aCvbk+qs/WQz/onhVtx+1w31HMkuFDCs
	 giZAkjmHjWSeYRqux8mXApJImYYVpoLEJhMQLgODXSPSDmgbQK4U9S7MzqrtGFeTWQ
	 LB24b4gryw7hQ==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4gH5hK4qVbz7wJM;
	Fri, 15 May 2026 14:13:37 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4gH5hJ72J4z8sb8;
	Fri, 15 May 2026 14:13:36 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id EB8A15F9AF;
	Fri, 15 May 2026 14:13:35 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <233da598-4172-4f16-9fd5-67590984616a@leemhuis.info>
Date: Fri, 15 May 2026 14:13:35 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] bisected: 7.1rc1 breaks backlight control on
 Thinkpad T480
To: Stefan Seyfried <stefan.seyfried@googlemail.com>
References: <d2de7933-e650-4b19-8d88-90d66693dcfc@message-id.googlemail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
Cc: Linux kernel regressions list <regressions@lists.linux.dev>,
 LKML <linux-kernel@vger.kernel.org>, "Kandpal, Suraj"
 <suraj.kandpal@intel.com>
In-Reply-To: <d2de7933-e650-4b19-8d88-90d66693dcfc@message-id.googlemail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <177884721620.1362752.15494549485330706711@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: EB8A15F9AF
X-NC-CID: XRgHjOpHSsaCFeQpddMFdTiAcd1Am+8IA0Vb4QtP0mpUnyyCtug=

On 5/15/26 13:47, Stefan Seyfried wrote:
> 
> I found that 7.1rc1 broke the backlight control on my Thinkpad T480.
> Bisected it to
>
>> 40d2f5820951dee818d05c14677277048bd85f9f is the first bad commit
>> commit 40d2f5820951dee818d05c14677277048bd85f9f
>> Author: Suraj Kandpal <suraj.kandpal@intel.com>
>> Date:   Tue Feb 24 08:43:22 2026 +0530
>>
>>     drm/i915/backlight: Remove try_vesa_interface

FWIW: Here are two bug reports that contain proposed fixes for what
might or might not be the issue your face:

https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16043
https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16015

Ciao,  Thorsten

>>         Some panels need VESA DPCD AUX backlight but VBT says otherwise.
>>     This is why we try with Intel backlight interface over VESA backlight
>>     interface. This causes a blankout on such panels without any fallback
>>     mechanism.
>>     Remove try_vesa_interface and use VESA AUX backlight interface as a
>>     fallback mechanism.
>>     While at in sneak in a small comment cleanup too.
>>         Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/
>> issues/15679
>>     Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
>>     Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>>     Link: https://patch.msgid.link/20260224031322.2568874-1-
>> suraj.kandpal@intel.com
>>
>>  drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 19 ++++++
>> +------------
>>  1 file changed, 7 insertions(+), 12 deletions(-)
> 
> Please revert :-)
> 
> Best regards,

