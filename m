Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC6E17C0
	for <regressions@lists.linux.dev>; Sun, 27 Mar 2022 09:00:15 +0000 (UTC)
Received: from ip4d144895.dynamic.kabel-deutschland.de ([77.20.72.149] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nYOkp-0001jQ-OB; Sun, 27 Mar 2022 11:00:07 +0200
Message-ID: <be9fe3f6-f6a1-f293-5fdc-0ec3c46c5952@leemhuis.info>
Date: Sun, 27 Mar 2022 11:00:04 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [REGRESSION] Recent swiotlb DMA_FROM_DEVICE fixes break
 ath9k-based AP #forregzbot
Content-Language: en-US
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <1812355.tdWV9SEqCh@natalenko.name>
 <dab4615d-2e57-de1b-4df9-f99b34ef4874@leemhuis.info>
 <6374a239-fe40-4aa2-771c-bf628b822b69@leemhuis.info>
In-Reply-To: <6374a239-fe40-4aa2-771c-bf628b822b69@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1648371616;5c1aaa7e;
X-HE-SMSGID: 1nYOkp-0001jQ-OB

On 25.03.22 10:24, Thorsten Leemhuis wrote:
> On 24.03.22 13:32, Thorsten Leemhuis wrote:
>> TWIMC: this mail is primarily send for documentation purposes and for
>> regzbot, my Linux kernel regression tracking bot. These mails usually
>> contain '#forregzbot' in the subject, to make them easy to spot and filter.
> 
> #regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=215703
> #regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=215698

#regzbot fixed-by: bddac7c1e02ba47f0570e494c9289acea3062cc1
