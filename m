Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D3E3C04
	for <regressions@lists.linux.dev>; Thu, 23 Mar 2023 10:25:29 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pfI8H-0005jx-B8; Thu, 23 Mar 2023 11:25:21 +0100
Message-ID: <7cc69aa5-e003-6ac7-9b2f-a95b67eb98e8@leemhuis.info>
Date: Thu, 23 Mar 2023 11:25:20 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: pull request: rtw89: 8852b: rollback firmware to v0.27.32.1 and
 introduce new file to new format
Content-Language: en-US, de-DE
To: Josh Boyer <jwboyer@kernel.org>, Ping-Ke Shih <pkshih@realtek.com>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "kvalo@kernel.org" <kvalo@kernel.org>,
 "rb0171610@gmail.com" <rb0171610@gmail.com>,
 "Larry.Finger@lwfinger.net" <Larry.Finger@lwfinger.net>,
 "tiwai@suse.de" <tiwai@suse.de>,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <889f3db6ca4008047595f4392388acc1f165e03c.camel@realtek.com>
 <CA+5PVA4H9Quu1954ubbcZfH-e1cOy2K27r0GfLemQcMBG-6AQA@mail.gmail.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <CA+5PVA4H9Quu1954ubbcZfH-e1cOy2K27r0GfLemQcMBG-6AQA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1679567129;918ed788;
X-HE-SMSGID: 1pfI8H-0005jx-B8

On 20.03.23 12:43, Josh Boyer wrote:
> On Sat, Mar 18, 2023 at 9:59 AM Ping-Ke Shih <pkshih@realtek.com> wrote:
>>
>> In discussion threads [1] [2], the new format of 8852b break user space.
>> To avoid this, introduce new filename rtw89/rtw8852b_fw-1.bin that old
>> drivers will not try to load it.
>>
>> Rollback firmware version of rtw89/rtw8852b_fw.bin to the latest
>> version of original format (i.e. v0.27.32.1) supported by old driver.
>>
>> The patches to support new filename in new driver are almost done,
>> and I will submit them soon. Thanks for the advice in mail and
>> bug threads.
>> [...]
> Pulled and pushed out.

Thx to both of you for submitting the revert and applying it.

Josh, do you plan to do another release soon? I fear that otherwise more
distros and users will run into this regression.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.
