Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741496FC9
	for <regressions@lists.linux.dev>; Mon, 15 May 2023 09:10:05 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pyUDS-0002Wj-0h; Mon, 15 May 2023 11:10:02 +0200
Message-ID: <36eac50e-912b-a9af-2041-4d28b2eeb4e8@leemhuis.info>
Date: Mon, 15 May 2023 11:10:01 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Re: [PATCH] wifi: iwlwifi: mvm: rfi: disable RFI feature
Content-Language: en-US, de-DE
To: Jeff Chua <jeff.chua.linux@gmail.com>, gregory.greenman@intel.com
Cc: johannes@sipsolutions.net, linux-wireless@vger.kernel.org,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <20230430201830.2f8f88fe49f6.I2f0076ef1d1cbe5d10010549c875b7038ec4c365@changeid>
 <CAAJw_ZuFaE-oYWQWQ+k0Lz_GcJH+adF6SZuwaKpV8UB0XGqVzw@mail.gmail.com>
 <CAAJw_ZsK5c5Y7NpFeNG6i2-kozeT9jscog57+bwwEy6RtiFm8Q@mail.gmail.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <CAAJw_ZsK5c5Y7NpFeNG6i2-kozeT9jscog57+bwwEy6RtiFm8Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1684141805;bed85796;
X-HE-SMSGID: 1pyUDS-0002Wj-0h

On 04.05.23 15:30, Jeff Chua wrote:
> On Mon, May 1, 2023 at 7:56 AM Jeff Chua <jeff.chua.linux@gmail.com> wrote:
>>
>> On Mon, May 1, 2023 at 1:18 AM <gregory.greenman@intel.com> wrote:
>>>
>>> From: Gregory Greenman <gregory.greenman@intel.com>
>>>
>>> This feature depends on a platform bugfix. Until we have a
>>> mechanism that can verify a platform has the required bugfix,
>>> disable RFI.

Hmm, looks from here like there was no progress with this for two weeks
now. :-/

>> Greg,
>>
>> Patch applied and worked! Thank you!
> 
> Only issue with that is I was in the office with EAP, and couldn't
> connect to the WIFI. I'll need more time to bisect next week at the
> office.

Jeff, did you ever look into this and check if that's due to the
proposed patch or some other change applied for 6.4? If it's (likely)
the latter it might be the best if we go ahead with this change and
handle the other problem separately.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.
