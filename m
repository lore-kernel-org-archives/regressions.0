Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1AC1548D
	for <regressions@lists.linux.dev>; Tue, 29 Aug 2023 11:33:12 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qawy6-0006XV-SO; Tue, 29 Aug 2023 13:33:10 +0200
Message-ID: <afe1fc2c-e3dd-9da1-1a80-27d81f16774b@leemhuis.info>
Date: Tue, 29 Aug 2023 13:33:10 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] breakage in sun6i-csi media api
Content-Language: en-US, de-DE
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: linux-media@vger.kernel.org
References: <f13c27fb-2afe-b94e-aad9-ed5ecc818183@brixit.nl>
 <ZHmzZUkcFK8Gq_JL@aptenodytes>
 <e168d246-528d-b615-aa50-af8f17af4442@brixit.nl>
 <ZHm46or-MhTb457b@aptenodytes>
 <20230602100352.GK19463@pendragon.ideasonboard.com>
 <25cf3947-1fe0-7280-09e2-3dc107b2c8e7@leemhuis.info>
 <20230629000837.122abd21@sal.lan> <ZK68_SoDU6GQSbh2@aptenodytes>
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <ZK68_SoDU6GQSbh2@aptenodytes>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1693308792;fbe6ea75;
X-HE-SMSGID: 1qawy6-0006XV-SO

[TLDR: This mail in primarily relevant for Linux kernel regression
tracking. See link in footer if these mails annoy you.]

On 12.07.23 16:47, Paul Kocialkowski wrote:
> On Thu 29 Jun 23, 00:08, Mauro Carvalho Chehab wrote:
>> Em Mon, 26 Jun 2023 14:23:50 +0200
>> "Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info> escreveu:
>>
>> IMO, the best here would be to modify the application to be smarter,
>> using the topology actually reported by MEDIA_IOC_G_TOPOLOGY, instead
>> on relying on some specific hard-coded types.
> Absolutely!

#regzbot resolve: reverting or fixing would cause other regression,
fixing the app thus is the better of two bad solutions
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.
