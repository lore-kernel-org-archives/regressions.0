Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2246C259C
	for <regressions@lists.linux.dev>; Fri, 27 Jan 2023 11:32:59 +0000 (UTC)
Received: from [2a02:8108:963f:de38:4bc7:2566:28bd:b73c]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pLMyW-00024h-SK; Fri, 27 Jan 2023 12:32:56 +0100
Message-ID: <b1abd22f-ca6c-54f4-9fa8-29f31ca8a729@leemhuis.info>
Date: Fri, 27 Jan 2023 12:32:56 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: Missing sriov_numvfs after removal of EfiMemoryMappedIO from E820
 map
Content-Language: en-US, de-DE
To: Peifeng Qiu <linux@qiupf.dev>,
 Linux regressions mailing list <regressions@lists.linux.dev>
Cc: bhelgaas@google.com, linux-pci@vger.kernel.org
References: <CAPH51bc1ZoP2ukJJh8nfrNY1FCp1nk7AP0jGGCvoskq2XbmAoA@mail.gmail.com>
 <029045a9-5006-e663-571f-b67344fa3a50@leemhuis.info>
 <2f866122-6a56-dfc7-9add-5168a4e796b2@leemhuis.info>
 <CAPH51bdcXFCiHrFPnMYGznsrCTOHDB0fyujFy3y5e8PWWYnnbQ@mail.gmail.com>
From: "Linux kernel regression tracking (#update)" <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <CAPH51bdcXFCiHrFPnMYGznsrCTOHDB0fyujFy3y5e8PWWYnnbQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1674819179;0b9c8a90;
X-HE-SMSGID: 1pLMyW-00024h-SK

[TLDR: This mail in primarily relevant for Linux kernel regression
tracking. See link in footer if these mails annoy you.]

On 16.01.23 11:14, Peifeng Qiu wrote:
> On Mon, Jan 16, 2023 at 12:41 AM Linux kernel regression tracking
> (Thorsten Leemhuis) <regressions@leemhuis.info> wrote:
>>
>> Forget to mention one small detail:
>>
>> On 15.01.23 15:21, Linux kernel regression tracking (Thorsten Leemhuis)
>> wrote:
>>> [CCing the regression list, as it should be in the loop for regressions:
>>> https://docs.kernel.org/admin-guide/reporting-regressions.html]
>>>
>>> Hi, this is your Linux kernel regression tracker.
>>>
>>> On 15.01.23 10:21, Peifeng Qiu wrote:
>>>>
>>>> I'm using a dual Xeon system with Intel e810 25G network card and make use
>>>> of SRIOV feature heavily. I have a script to setup the NIC the first step is
>>>> echo $VFS > /sys/class/net/$DEVNAME/device/sriov_numvfs
>>>>
>>>> After switching from v6.1 to v6.2-rc1 "sriov_numvfs" is no longer present. If I
>>>> switch back to v6.1 it's back. Command line parameters are the same so it's
>>>> most likely kernel changes. I did git bisect and found the culprit to be
>>>> 07eab0901ed(efi/x86: Remove EfiMemoryMappedIO from E820 map)
>>>
>>> This is not my area of expertise, but there is another report about an
>>> issue that was bisected to that particular commit:
>>>
>>> https://lore.kernel.org/lkml/ac2693d8-8ba3-72e0-5b66-b3ae008d539d@linux.intel.com/
>>>
>>> A fix for that one was posted here:
>>>
>>> https://lore.kernel.org/lkml/20230110180243.1590045-1-helgaas@kernel.org/
>>>
>>> You might want to look into the report and if it looks like a possible
>>> duplicate give the proposed fix a try.
>>
>> FWIW, that patch was recently mainlined and thus will be in 6.2-rc4 that
>> Linus will likely release in a few hours.
>>
>> Ciao, Thorsten
> 
> I just tested the latest v6.2-rc4 and I can confirm that the issue is
> fixed. Thanks!

In that case:

#regzbot fix: fd3a8cff4d4a
#regzbot ignore-activity

[better late than never]

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
