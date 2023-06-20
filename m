Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F35156F0
	for <regressions@lists.linux.dev>; Tue, 20 Jun 2023 14:16:22 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qBc9c-0006w4-Hj; Tue, 20 Jun 2023 16:16:20 +0200
Message-ID: <19199830-33b6-2a4c-e08b-d1a76ce4c59b@leemhuis.info>
Date: Tue, 20 Jun 2023 16:16:20 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: issues with cdc ncm host class driver
Content-Language: en-US, de-DE
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Oliver Neukum <oneukum@suse.com>,
 "Purohit, Kaushal" <kaushal.purohit@ti.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <da37bb0d43de465185c10aad9924f265@ti.com>
 <28ec4e65-647f-2567-fb7d-f656940d4e43@suse.com>
 <da479ebf-b3fb-0a58-16be-07fe55d36621@leemhuis.info>
In-Reply-To: <da479ebf-b3fb-0a58-16be-07fe55d36621@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1687270582;bd39fb3c;
X-HE-SMSGID: 1qBc9c-0006w4-Hj

On 04.04.23 12:33, Linux regression tracking (Thorsten Leemhuis) wrote:
> Side note: there is now a bug tracking ticket for this issue, too:
> https://bugzilla.kernel.org/show_bug.cgi?id=217290
> 
> On 03.04.23 12:09, Oliver Neukum wrote:
>> On 03.04.23 08:14, Purohit, Kaushal wrote:
> 
>>> Referring to patch with commit ID
>>> (*e10dcb1b6ba714243ad5a35a11b91cc14103a9a9*).
>>>
>>> This is a spec violation for CDC NCM class driver. Driver clearly says
>>> the significance of network capabilities. (snapshot below)
>>>
>>> However, with the mentioned patch these values are disrespected and
>>> commands specific to these capabilities are sent from the host
>>> regardless of device' capabilities to handle them.
>>
>> Right. So for your device, the correct behavior would be to do
>> nothing, wouldn't it? The packets would be delivered and the host
>> needs to filter and discard unrequested packets.
> 
> #regzbot ^introduced e10dcb1b6ba714243ad
> https://bugzilla.kernel.org/show_bug.cgi?id=217290
> #regzbot from: Purohit, Kaushal
> #regzbot title net: cdc_ncm: spec violation for CDC NCM
> #regzbot ignore-activity

Not sure what happen to this, my last inquiries were not answered, so it
seems nobody cares anymore

#regzbot inconclusive: radio silence, ignoring
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

